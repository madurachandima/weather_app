import 'package:get_it/get_it.dart';

import 'data/datasources/current_weather_data_source.dart';
import 'data/repositorie_impl/current_weather_repository_impl.dart';
import 'domain/repositories/current_weather_repository.dart';
import 'domain/usecases/get_current_wather.dart';
import 'presentation/bloc/weather/current_weather_bloc.dart';

void initiateCurrentWeatherFeature(GetIt getIt) {

  getIt.registerLazySingleton(() => CurrentWeatherDataSource(getIt()));

  getIt.registerFactory(() => CurrentWeatherBloc(getIt()));

  getIt.registerLazySingleton(
      () => GetCurrentWeather(currentWeatherRepository: getIt()));

  getIt.registerLazySingleton<CurrentWeatherRepository>(
      () => CurrentWeatherRepositoryImpl(currentWeatherDataSource: getIt()));
}
