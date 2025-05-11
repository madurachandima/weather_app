part of 'current_weather_bloc.dart';

@immutable
sealed class CurrentWeatherEvent {}

class FetchCurrentWeather extends CurrentWeatherEvent {
  final PositionEntity position;

  FetchCurrentWeather({required this.position});
}
