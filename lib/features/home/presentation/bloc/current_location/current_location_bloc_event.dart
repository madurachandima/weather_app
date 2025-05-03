part of 'current_location_bloc.dart';

@immutable
sealed class CurrentLocationBlocEvent {}

class FetchLocationEvent extends CurrentLocationBlocEvent {
  FetchLocationEvent();
}
