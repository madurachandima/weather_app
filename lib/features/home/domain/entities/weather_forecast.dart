class WeatherForecast {
  String? locationName;
  int? sunrise;
  int? sunset;
  List<List<WeatherForecastElement>>? weatherForecasts;

  WeatherForecast(
      {this.locationName, this.sunrise, this.sunset, this.weatherForecasts});
}

class WeatherForecastElement {
  String? weatherCondition;
  String? weatherDescription;
  int? weatherConditionId;
  double? temp;
  int? humidity;
  double? windSpeed;
  DateTime? date;

  WeatherForecastElement(
      {this.weatherCondition,
      this.weatherDescription,
      this.weatherConditionId,
      this.temp,
      this.humidity,
      this.windSpeed,
      this.date});
}
