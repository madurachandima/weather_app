import 'package:geolocator/geolocator.dart';

import '../../domain/entities/position.dart';

class PositionModel extends PositionEntity {
  PositionModel(
      {required super.latitude,
      required super.longitude,
      required super.locationName});

  factory PositionModel.fromGeolocatorPosition(
      Position position, String? locationName) {
    return PositionModel(
      latitude: position.latitude,
      longitude: position.longitude,
      locationName: locationName,
    );
  }
}
