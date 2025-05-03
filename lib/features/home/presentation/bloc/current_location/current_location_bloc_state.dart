part of 'current_location_bloc.dart';

@immutable
sealed class CurrentLocationBlocState {}

final class CurrentLocationBlocInitial extends CurrentLocationBlocState {}

class CurrentLocationBlocLoading extends CurrentLocationBlocState {
  CurrentLocationBlocLoading();
}

class CurrentLocationBlocLoaded extends CurrentLocationBlocState {
  final PositionEntity position;

  CurrentLocationBlocLoaded({required this.position});
}

class CurrentLocationBlocError extends CurrentLocationBlocState {
  final String error;

  CurrentLocationBlocError({required this.error});
}
