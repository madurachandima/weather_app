class WindModel {
  double? speed;
  int? deg;
  double? gust;

  WindModel({
    this.speed,
    this.deg,
    this.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) => WindModel(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],
    gust: json["gust"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}