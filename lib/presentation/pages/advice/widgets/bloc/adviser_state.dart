part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerState extends Equatable {

  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerState {}

class AdvicerLoading extends AdvicerState{}

class AdvicerLoaded extends AdvicerState{
  final String advice;
  AdvicerLoaded({required  this.advice});


  @override
  List<Object?> get props => [advice];

}
class AdvicerError extends AdvicerState{
  final String message;
  
  AdvicerError({required this.message});
  @override
  List<Object?> get props => [message];
}
