import '../entities/position.dart';
import '../entities/weather_forecast.dart';

abstract class WeatherForeCastRepository {
  Future<WeatherForecast> getWeatherForecast(PositionEntity position);
}
