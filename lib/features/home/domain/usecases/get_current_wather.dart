import 'package:weather_app/features/home/domain/entities/weather.dart';

import '../entities/position.dart';
import '../repositories/current_weather_repository.dart';

class GetCurrentWeather {
  final CurrentWeatherRepository currentWeatherRepository;

  GetCurrentWeather({required this.currentWeatherRepository});

  Future<Weather> call(PositionEntity position) async {
    return await currentWeatherRepository.getCurrentWeather(position);
  }
}
