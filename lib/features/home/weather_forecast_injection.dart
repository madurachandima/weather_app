import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/data/datasources/weather_forecast_data_source.dart';
import 'package:weather_app/features/home/data/repositorie_impl/weather_forecast_repository_impl.dart';
import 'package:weather_app/features/home/domain/usecases/get_weather_forecast.dart';

import 'domain/repositories/weather_forcast_repository.dart';
import 'presentation/bloc/weather_forecast/weather_forecast_bloc.dart';

void initiateWeatherForecastFeature(GetIt getIt) {
  getIt.registerLazySingleton(() => WeatherForecastDataSource(getIt()));

  getIt.registerFactory(() => WeatherForecastBloc(getIt()));

  getIt.registerLazySingleton(
      () => GetWeatherForecast(weatherForeCastRepository: getIt()));

  getIt.registerLazySingleton<WeatherForeCastRepository>(
      () => WeatherForecastRepositoryImpl(weatherForecastDataSource: getIt()));
}
