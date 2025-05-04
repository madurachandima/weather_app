import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/home/domain/entities/position.dart';
import 'package:weather_app/features/home/domain/usecases/get_current_wather.dart';

import '../../../domain/entities/weather.dart';

part 'current_weather_event.dart';

part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeather getCurrentWeather;

  CurrentWeatherBloc(this.getCurrentWeather) : super(CurrentWeatherInitial()) {
    on<FetchCurrentWeather>((event, emit) async {
      emit(CurrentWeatherLoading());
      try {
        PositionEntity position = event.position;
        final weather = await getCurrentWeather(position);
        emit(CurrentWeatherLoaded(weather: weather));
      } catch (e) {
        emit(CurrentWeatherError(error: e.toString()));
      }
    });
  }
}
