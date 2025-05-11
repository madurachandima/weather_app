import '../repositories/background_image_repository.dart';

class GetBackgroundImageUseCase {
  final BackgroundImageRepository backgroundImageRepository;

  GetBackgroundImageUseCase({required this.backgroundImageRepository});

  Future<String> getBackgroundImage(String locationName) async {
    try {
      return await backgroundImageRepository.getBackgroundImage(locationName);
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
