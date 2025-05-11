import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/current_weather_injection.dart';
import 'package:weather_app/features/home/location_injection.dart';

import 'core/network/network_injection.dart';
import 'features/home/weather_background_image_injection.dart';
import 'features/home/weather_forecast_injection.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  await initiateNetworkFeature(getIt);
  initiateLocationFeature(getIt);
  initiateCurrentWeatherFeature(getIt);
  initiateWeatherForecastFeature(getIt);
  initiateBackgroundFeature(getIt);
}
