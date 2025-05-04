import 'package:flutter/foundation.dart';
import 'package:weather_app/core/model/response.dart';
import 'package:weather_app/core/network/dio_client.dart';
import 'package:weather_app/core/network/url.dart';

import '../../domain/entities/position.dart';
import '../models/current_weather/current_weather_model.dart';

class CurrentWeatherDataSource {
  final DioClient dioClient;

  CurrentWeatherDataSource(this.dioClient);

  Future<Response> getCurrentWeatherData(PositionEntity position) async {
    try {
      final queryParameters = {
        'lat': '${position.latitude}',
        'lon': '${position.longitude}'
      };
      final response =
          await dioClient.get(currentWeather, queryParameters: queryParameters);

      if (response.statusCode != 200) {
        return Response(success: false, message: "Something went wrong");
      }

      return Response(
          success: true, data: CurrentWeatherModel.fromJson(response.data));
    } catch (e) {
      if (kDebugMode) {
        print("getCurrentWeatherData error -> $e");
      }
      return Response(success: false, message: "Something went wrong");
    }
  }
}
