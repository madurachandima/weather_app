import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/data/datasources/location_data_sources.dart';
import 'package:weather_app/features/home/presentation/bloc/current_location/current_location_bloc.dart';

import 'data/repositorie_impl/location_repository_impl.dart';
import 'domain/repositories/location_repository.dart';
import 'domain/usecases/get_current_location.dart';

void initiateLocationFeature(GetIt getIt) {
  getIt.registerFactory(() => CurrentLocationBloc(getIt()));

  getIt.registerLazySingleton(
      () => GetCurrentLocation(locationRepository: getIt()));

  getIt.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(locationDataSources: getIt()));

  getIt.registerLazySingleton(() => LocationDataSources());
  
}
