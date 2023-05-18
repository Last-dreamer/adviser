part of 'adviser_bloc.dart';

@immutable
abstract class AdviserState {}

class AdviserInitial extends AdviserState {}

class AdviserLoading extends AdviserState{}

class AdviserLoaded extends AdviserState{
  final String adivce;
  AdviserLoaded({required  this.adivce});

}
class AdviserError extends AdviserState{
  final String message;
  
  AdviserError({required this.message});
}
