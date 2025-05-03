import 'package:get_it/get_it.dart';
import 'package:weather_app/features/home/location_injection.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  initiateLocationFeature(getIt);
}
