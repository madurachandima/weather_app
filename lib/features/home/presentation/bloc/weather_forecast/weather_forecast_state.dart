part of 'weather_forecast_bloc.dart';

@immutable
sealed class WeatherForecastState {}

final class WeatherForecastInitial extends WeatherForecastState {}

class WeatherForecastLoading extends WeatherForecastState {
  WeatherForecastLoading();
}

class WeatherForecastLoaded extends WeatherForecastState {
  final WeatherForecast weather;

  WeatherForecastLoaded({required this.weather});
}

class WeatherForecastError extends WeatherForecastState {
  final String error;

  WeatherForecastError({required this.error});
}
