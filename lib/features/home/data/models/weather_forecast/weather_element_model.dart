import 'package:weather_app/features/home/data/models/current_weather/cloud_model.dart';
import 'package:weather_app/features/home/data/models/current_weather/main_model.dart';
import 'package:weather_app/features/home/data/models/current_weather/sys_model.dart';
import 'package:weather_app/features/home/data/models/current_weather/weather_data_model.dart';
import 'package:weather_app/features/home/data/models/current_weather/wind_model.dart';

class WeatherElementModel {
  int? dt;
  MainModel? main;
  List<WeatherDataModel>? weather;
  CloudsModel? clouds;
  WindModel? wind;
  int? visibility;

  SysModel? sys;
  DateTime? dtTxt;

  WeatherElementModel({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.sys,
    this.dtTxt,
  });

  factory WeatherElementModel.fromJson(Map<String, dynamic> json) =>
      WeatherElementModel(
        dt: json["dt"],
        main: json["main"] == null ? null : MainModel.fromJson(json["main"]),
        weather: json["weather"] == null
            ? []
            : List<WeatherDataModel>.from(
                json["weather"]!.map((x) => WeatherDataModel.fromJson(x))),
        clouds: json["clouds"] == null
            ? null
            : CloudsModel.fromJson(json["clouds"]),
        wind: json["wind"] == null ? null : WindModel.fromJson(json["wind"]),
         visibility: json["visibility"],
        sys: json["sys"] == null ? null : SysModel.fromJson(json["sys"]),
        dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
      );
}
