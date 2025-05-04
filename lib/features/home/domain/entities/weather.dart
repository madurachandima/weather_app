class Weather {
  String? weatherCondition;
  String? weatherDescription;
  String? weatherIcon;
  double? temp;
  int? humidity;
  double? windSpeed;
  int? sunrise;
  int? sunset;
  String? locationName;

  Weather(
      {this.weatherCondition,
      this.weatherDescription,
      this.weatherIcon,
      this.temp,
      this.humidity,
      this.windSpeed,
      this.sunrise,
      this.sunset,
      this.locationName});
}
