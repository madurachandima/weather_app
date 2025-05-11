import 'dart:math';

import '../../../../core/model/response.dart';
import '../../../../core/network/url.dart';
import '../../domain/repositories/background_image_repository.dart';
import '../datasources/background_image_data_source.dart';
import '../models/background_image_model.dart';

class BackgroundImageRepositoryImpl extends BackgroundImageRepository {
  final BackgroundImageDataSource backgroundImageDataSource;

  BackgroundImageRepositoryImpl({required this.backgroundImageDataSource});

  @override
  Future<String> getBackgroundImage(String locationName) async {
    try {
      final Response response =
          await backgroundImageDataSource.getBackgroundImage(locationName);

      if (!response.success) {
        throw Exception(response.message);
      }
      BackgroundImage? backgroundImageModel = response.data;
      if (backgroundImageModel?.results != null &&
          backgroundImageModel!.results!.isEmpty) return defaultImage;
      int length = backgroundImageModel!.results!.length;
      int index = Random().nextInt(length);
      return backgroundImageModel.results![index].urls?.regular ?? defaultImage;
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
