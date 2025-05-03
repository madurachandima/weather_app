import 'package:weather_app/features/home/domain/entities/position.dart';

import '../repositories/location_repository.dart';

class GetCurrentLocation {
  final LocationRepository locationRepository;

  GetCurrentLocation({required this.locationRepository});

  Future<PositionEntity> call() async {
    return await locationRepository.getCurrentLocation();
  }
}
