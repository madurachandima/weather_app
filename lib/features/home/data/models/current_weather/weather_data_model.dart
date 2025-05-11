

class WeatherDataModel {
  int? id;
  String? main;
  String? description;
  String? icon;

  WeatherDataModel({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) => WeatherDataModel(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}