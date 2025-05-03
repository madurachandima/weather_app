import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/position.dart';
import '../../../domain/usecases/get_current_location.dart';

part 'current_location_bloc_event.dart';
part 'current_location_bloc_state.dart';

class CurrentLocationBloc
    extends Bloc<CurrentLocationBlocEvent, CurrentLocationBlocState> {
  final GetCurrentLocation getCurrentLocation;

  CurrentLocationBloc(this.getCurrentLocation)
      : super(CurrentLocationBlocInitial()) {
    on<CurrentLocationBlocEvent>((event, emit) async {
      emit(CurrentLocationBlocLoading());

      try {
        final position = await getCurrentLocation();
        emit(CurrentLocationBlocLoaded(position: position));
      } catch (e) {
        emit(CurrentLocationBlocError(error: e.toString()));
      }
    });
  }
}
