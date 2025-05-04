

import 'package:weather_app/features/home/domain/entities/weather.dart';

import '../entities/position.dart';

abstract class CurrentWeatherRepository {
  Future<Weather> getCurrentWeather(PositionEntity position);
}
