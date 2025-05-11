import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/model/response.dart' as r;
import '../../../../core/network/dio_client.dart';
import '../models/background_image_model.dart';

class BackgroundImageDataSource {
  final DioClient dioClient;

  BackgroundImageDataSource(this.dioClient);

  Future<r.Response> getBackgroundImage(String locationName) async {
    try {
      final dio = Dio();

      final queryParameters = {
        'query': '$locationName}',
        'client_id': '2s4zfYBDm7sWBc3CuPUT3EP0JeQt5dbdWzvOBONc0Uk',
        'orientation': 'portrait',
        'per_page': 100
      };

      final response = await dio.get('https://api.unsplash.com/search/photos',
          queryParameters: queryParameters);

      if (response.statusCode != 200) {
        return r.Response(success: false, message: "Something went wrong");
      }

      return r.Response(
          success: true, data: BackgroundImage.fromJson(response.data));
    } catch (e) {
      if (kDebugMode) {
        print("getBackgroundImage error -> $e");
      }
      return r.Response(success: false, message: "Something went wrong");
    }
  }
}
