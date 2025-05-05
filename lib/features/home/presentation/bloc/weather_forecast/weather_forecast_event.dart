part of 'weather_forecast_bloc.dart';

@immutable
sealed class WeatherForecastEvent {}

class FetchWeatherForecast extends WeatherForecastEvent {
  final PositionEntity position;

  FetchWeatherForecast({required this.position});
}
