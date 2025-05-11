import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/position.dart';
import '../../../domain/entities/weather_forecast.dart';
import '../../../domain/usecases/get_weather_forecast.dart';

part 'weather_forecast_event.dart';

part 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final GetWeatherForecast getWeatherForecast;

  WeatherForecastBloc(this.getWeatherForecast)
      : super(WeatherForecastInitial()) {
    on<FetchWeatherForecast>((event, emit) async {
      emit(WeatherForecastLoading());
      try {
        PositionEntity position = event.position;
        final weather = await getWeatherForecast(position);
        emit(WeatherForecastLoaded(weather: weather));
      } catch (e) {
        emit(WeatherForecastError(error: e.toString()));
      }
    });
  }
}
