import 'package:weather_app/features/home/data/models/current_weather/coord_model.dart';

import 'cloud_model.dart';
import 'main_model.dart';
import 'sys_model.dart';
import 'weather_data_model.dart';
import 'wind_model.dart';


class CurrentWeatherModel {
  CoordModel? coord;
  List<WeatherDataModel>? weather;
  String? base;
  MainModel? main;
  int? visibility;
  WindModel? wind;
  CloudsModel? clouds;
  int? dt;
  SysModel? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => CurrentWeatherModel(
        coord: json["coord"] == null ? null : CoordModel.fromJson(json["coord"]),
        weather: json["weather"] == null
            ? []
            : List<WeatherDataModel>.from(
                json["weather"]!.map((x) => WeatherDataModel.fromJson(x))),
        base: json["base"],
        main: json["main"] == null ? null : MainModel.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: json["wind"] == null ? null : WindModel.fromJson(json["wind"]),
        clouds: json["clouds"] == null ? null : CloudsModel.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: json["sys"] == null ? null : SysModel.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );
}
