import 'package:intl/intl.dart';
import 'package:weather_app/core/model/response.dart';
import 'package:weather_app/features/home/data/datasources/weather_forecast_data_source.dart';
import 'package:weather_app/features/home/domain/entities/position.dart';
import 'package:weather_app/features/home/domain/entities/weather_forecast.dart';
import 'package:weather_app/features/home/domain/repositories/weather_forcast_repository.dart';

import '../models/weather_forecast/weather_element_model.dart';
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

      List<String> dates = [];

      if (weatherForecastModel.list != null &&
          weatherForecastModel.list!.isNotEmpty) {
        for (var element in weatherForecastModel.list!) {
          if (element.dtTxt != null) {
            final formattedDate =
                DateFormat('yyyy-MM-dd').format(element.dtTxt!);
            if (!dates.contains(formattedDate)) {
              dates.add(formattedDate);
            }
          }
        }

        List<List<WeatherElementModel>> listOfWeatherForecastsByDate = [];

        for (var date in dates) {
          List<WeatherElementModel> weatherForecastsByDate = [];

          weatherForecastsByDate
              .addAll(weatherForecastModel.list!.where((element) {
            if (element.dtTxt == null) return false;

            final formattedDate =
                DateFormat('yyyy-MM-dd').format(element.dtTxt!);
            return date == formattedDate;
          }).toList());
          listOfWeatherForecastsByDate.add(weatherForecastsByDate);
        }

        for (var element in listOfWeatherForecastsByDate) {
          List<WeatherForecastElement> weatherForecastElements = [];
          for (var element in element) {
            WeatherForecastElement weatherForecastElement =
                WeatherForecastElement(
              date: element.dtTxt,
              humidity: element.main?.humidity,
              temp: element.main?.temp,
              weatherCondition: element.weather?[0].main,
              weatherDescription: element.weather?[0].description,
              weatherConditionId: element.weather?[0].id,
              windSpeed: element.wind?.speed,
            );
            weatherForecastElements.add(weatherForecastElement);
          }
          weatherForecast.weatherForecasts ??= [];
          weatherForecast.weatherForecasts?.add(weatherForecastElements);
        }
      }
      return weatherForecast;
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
