class PositionEntity {
  final double latitude;
  final double longitude;
  final String? locationName;

  PositionEntity({
    required this.latitude,
    required this.longitude,
    required this.locationName,
  });

  @override
  String toString() {
    return 'CurrentLocation(latitude: $latitude, longitude: $longitude)';
  }
}
