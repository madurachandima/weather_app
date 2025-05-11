import 'package:get_it/get_it.dart';

import 'data/datasources/background_image_data_source.dart';
import 'data/repositorie_impl/background_image_repository_impl.dart';
import 'domain/repositories/background_image_repository.dart';
import 'domain/usecases/get_background_image.dart';
import 'presentation/bloc/background_image/background_image_bloc.dart';

void initiateBackgroundFeature(GetIt getIt) {
  getIt.registerLazySingleton(() => BackgroundImageDataSource(getIt()));

  getIt.registerFactory(() => BackgroundImageBloc(getIt()));

  getIt.registerLazySingleton(
      () => GetBackgroundImageUseCase(backgroundImageRepository: getIt()));

  getIt.registerLazySingleton<BackgroundImageRepository>(
      () => BackgroundImageRepositoryImpl(backgroundImageDataSource: getIt()));
}
