class PositionEntity {
  final double latitude;
  final double longitude;
  final String? locationName;
  final String? country;

  PositionEntity({
    required this.latitude,
    required this.longitude,
    required this.locationName,
    required this.country,
  });

  @override
  String toString() {
    return 'CurrentLocation(latitude: $latitude, longitude: $longitude)';
  }
}
