part of 'adviser_bloc.dart';

@immutable
abstract class AdviserState extends Equatable {

  @override
  List<Object?> get props => [];
}

class AdviserInitial extends AdviserState {}

class AdviserLoading extends AdviserState{}

class AdviserLoaded extends AdviserState{
  final String advice;
  AdviserLoaded({required  this.advice});


  @override
  List<Object?> get props => [advice];

}
class AdviserError extends AdviserState{
  final String message;
  
  AdviserError({required this.message});
  @override
  List<Object?> get props => [message];
}
