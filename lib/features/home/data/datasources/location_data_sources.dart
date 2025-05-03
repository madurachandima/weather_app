import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationDataSources {
  Future<Map<Position, Placemark>> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permissions are permanently denied");
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissions are denied");
      }
    }
    Position currentPosition = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    ));

    List<Placemark> placeData = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);

    return {currentPosition: placeData[0]};
  }
}
