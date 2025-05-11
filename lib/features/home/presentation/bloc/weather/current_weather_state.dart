part of 'current_weather_bloc.dart';

@immutable
sealed class CurrentWeatherState {}

final class CurrentWeatherInitial extends CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState {
  CurrentWeatherLoading();
}

class CurrentWeatherLoaded extends CurrentWeatherState {
  final Weather weather;

  CurrentWeatherLoaded({required this.weather});
}

class CurrentWeatherError extends CurrentWeatherState {
  final String error;

  CurrentWeatherError({required this.error});
}
