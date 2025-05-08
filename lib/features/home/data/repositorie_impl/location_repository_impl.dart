import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/home/data/datasources/location_data_sources.dart';
import 'package:weather_app/features/home/domain/entities/position.dart';
import 'package:weather_app/features/home/domain/repositories/location_repository.dart';

import '../models/position_model.dart';

class LocationRepositoryImpl extends LocationRepository {
  final LocationDataSources locationDataSources;

  LocationRepositoryImpl({required this.locationDataSources});

  @override
  Future<PositionEntity> getCurrentLocation() async {
    final Map<Position, Placemark> data =
        await locationDataSources.getCurrentLocation();

    Position position = data.keys.first;
    Placemark placemark = data.values.first;


    return PositionModel.fromGeolocatorPosition(
      position,
      placemark.name ?? "Unknown",
      placemark.country ?? "Unknown",
    );
  }
}
