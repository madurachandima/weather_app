class CoordModel {
  double? lon;
  double? lat;

  CoordModel({
    this.lon,
    this.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) => CoordModel(
    lon: json["lon"]?.toDouble(),
    lat: json["lat"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}