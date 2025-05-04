import 'package:dio/dio.dart';
import 'package:weather_app/core/network/url.dart';

class DioClient {
  final Dio dio;

  DioClient(
    this.dio,
  ) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      queryParameters: {"appId": "ed0f08b1152bbaf06ac2a7b73c56002d"},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    );

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
    ));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }
}
