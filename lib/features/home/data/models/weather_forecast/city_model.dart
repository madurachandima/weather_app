import 'package:weather_app/features/home/data/models/current_weather/coord_model.dart';

class CityModel {
  int? id;
  String? name;
  CoordModel? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  CityModel({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    name: json["name"],
    coord: json["coord"] == null ? null : CoordModel.fromJson(json["coord"]),
    country: json["country"],
    population: json["population"],
    timezone: json["timezone"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

}