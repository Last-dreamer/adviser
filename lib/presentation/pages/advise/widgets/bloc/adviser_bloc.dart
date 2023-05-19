 
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'adviser_event.dart';
part 'adviser_state.dart';

class AdviserBloc extends Bloc<AdviserEvent, AdviserState> {
  AdviserBloc() : super(AdviserInitial()) {
    on<AdviserEvent>((event, emit) async{
       emit(AdviserLoading());
       await Future.delayed(const Duration(seconds: 5), (){});
       emit(AdviserLoaded(advice: "New Advise wil be here ..."));
    });
  }
}
