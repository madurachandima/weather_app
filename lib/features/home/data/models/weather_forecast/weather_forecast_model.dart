

import 'city_model.dart';
import 'weather_element_model.dart';

class WeatherForecastModel {
  String? cod;
  int? message;
  int? cnt;
  List<WeatherElementModel>? list;
  CityModel? city;

  WeatherForecastModel({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) =>
      WeatherForecastModel(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: json["list"] == null
            ? []
            : List<WeatherElementModel>.from(
                json["list"]!.map((x) => WeatherElementModel.fromJson(x))),
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
      );
}
