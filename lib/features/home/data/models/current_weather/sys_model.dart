class SysModel {
  String? country;
  int? sunrise;
  int? sunset;

  SysModel({
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) => SysModel(
    country: json["country"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}