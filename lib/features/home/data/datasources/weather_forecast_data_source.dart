import 'package:flutter/foundation.dart';
import 'package:weather_app/core/network/url.dart';

import '../../../../core/model/response.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/entities/position.dart';
import '../models/weather_forecast/weather_forecast_model.dart';


class WeatherForecastDataSource {
  final DioClient dioClient;

  WeatherForecastDataSource(this.dioClient);

  Future<Response> getWeatherForecastData(PositionEntity position) async {
    try {
      final queryParameters = {
        'lat': '${position.latitude}',
        'lon': '${position.longitude}'
      };
      final response = await dioClient.get(weatherForecast,
          queryParameters: queryParameters);

      if (response.statusCode != 200) {
        return Response(success: false, message: "Something went wrong");
      }

      return Response(
          success: true, data: WeatherForecastModel.fromJson(response.data));
    } catch (e) {
      if (kDebugMode) {
        print("getWeatherForecastData error -> $e");
      }
      return Response(success: false, message: "Something went wrong");
    }
  }
}
