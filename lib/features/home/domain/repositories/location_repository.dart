import '../entities/position.dart';

abstract class LocationRepository {
  Future<PositionEntity> getCurrentLocation();
}