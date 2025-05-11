import 'package:weather_app/features/home/domain/repositories/weather_forcast_repository.dart';

import '../entities/position.dart';
import '../entities/weather_forecast.dart';

class GetWeatherForecast {
  final WeatherForeCastRepository weatherForeCastRepository;

  GetWeatherForecast({required this.weatherForeCastRepository});

  Future<WeatherForecast> call(PositionEntity position) async {
    return await weatherForeCastRepository.getWeatherForecast(position);
  }
}
