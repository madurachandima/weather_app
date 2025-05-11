import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'dio_client.dart';

Future<void> initiateNetworkFeature(GetIt getIt) async {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DioClient(getIt()));
}
