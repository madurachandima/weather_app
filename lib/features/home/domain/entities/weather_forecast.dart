class WeatherForecast {
  String? locationName;
  int? sunrise;
  int? sunset;
  List<WeatherForecastElement>? weatherForecast;

  WeatherForecast(
      {this.locationName, this.sunrise, this.sunset, this.weatherForecast});
}

class WeatherForecastElement {
  String? weatherCondition;
  String? weatherDescription;
  String? weatherIcon;
  double? temp;
  int? humidity;
  double? windSpeed;
  DateTime? date;

  WeatherForecastElement(
      {this.weatherCondition,
      this.weatherDescription,
      this.weatherIcon,
      this.temp,
      this.humidity,
      this.windSpeed,
      this.date});
}
