 
import 'package:adviser/domain/entities/advise_enitity.dart';
import 'package:adviser/domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/failures/failure.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {

   AdviseUseCases adviseUseCases = AdviseUseCases();
    on<AdvicerEvent>((event, emit) async{
       emit(AdvicerLoading());
       final failureOrAdvise  = await adviseUseCases.getAdvise();
       failureOrAdvise.fold(
        (failure) =>  emit(AdvicerError(message: _mapFailureToMessage(failure))),
        (success)=> emit(AdvicerLoaded(advice:success.advice))
       );
     
    });
  }
   String _mapFailureToMessage(Failure failure){
      switch (failure.runtimeType) {
        case ServerFailure:
              return "Ops, Api error, Please try again!";
        case CacheFailure:
        return "Ops, Cache failed, Please try again!";
        default: 
        return "Ops, something is wrong, Please try again!";
      }
    }

}
