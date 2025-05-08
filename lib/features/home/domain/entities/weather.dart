class Weather {
  String? weatherCondition;
  String? weatherDescription;
  int? weatherConditionId;
  double? temp;
  int? humidity;
  double? windSpeed;
  int? sunrise;
  int? sunset;
  String? locationName;

  Weather(
      {this.weatherCondition,
      this.weatherDescription,
      this.weatherConditionId,
      this.temp,
      this.humidity,
      this.windSpeed,
      this.sunrise,
      this.sunset,
      this.locationName});
}
