import 'package:weather_app/core/model/response.dart';
import 'package:weather_app/features/home/data/datasources/weather_forecast_data_source.dart';
import 'package:weather_app/features/home/domain/entities/position.dart';
import 'package:weather_app/features/home/domain/entities/weather_forecast.dart';
import 'package:weather_app/features/home/domain/repositories/weather_forcast_repository.dart';

import '../models/weather_forecast/weather_forecast_model.dart';



class WeatherForecastRepositoryImpl extends WeatherForeCastRepository {
  final WeatherForecastDataSource weatherForecastDataSource;

  WeatherForecastRepositoryImpl({required this.weatherForecastDataSource});

  @override
  Future<WeatherForecast> getWeatherForecast(PositionEntity position) async {
    try {
      Response response =
          await weatherForecastDataSource.getWeatherForecastData(position);

      if (!response.success) {
        throw Exception(response.message);
      }

      WeatherForecastModel weatherForecastModel = response.data;

      WeatherForecast weatherForecast = WeatherForecast();

      weatherForecast.locationName = weatherForecastModel.city?.name;
      weatherForecast.sunrise = weatherForecastModel.city?.sunrise;
      weatherForecast.sunset = weatherForecastModel.city?.sunset;

      if (weatherForecastModel.list != null &&
          weatherForecastModel.list!.isNotEmpty) {
        for (var element in weatherForecastModel.list!) {
          WeatherForecastElement weatherForecastElement =
              WeatherForecastElement(
            date: element.dtTxt,
            humidity: element.main?.humidity,
            temp: element.main?.temp,
            weatherCondition: element.weather?[0].main,
            weatherDescription: element.weather?[0].description,
            weatherIcon: element.weather?[0].icon,
            windSpeed: element.wind?.speed,
          );
          weatherForecast.weatherForecast ??= [];
          weatherForecast.weatherForecast?.add(weatherForecastElement);
        }
      }
      return weatherForecast;
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
