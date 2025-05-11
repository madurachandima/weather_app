import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/current_location/current_location_bloc.dart';

import 'features/home/presentation/bloc/background_image/background_image_bloc.dart';
import 'features/home/presentation/bloc/weather/current_weather_bloc.dart';
import 'features/home/presentation/bloc/weather_forecast/weather_forecast_bloc.dart';
import 'injection_container.dart' as di;

get blocProviders => [
      BlocProvider(create: (_) => di.getIt<CurrentLocationBloc>()),
      BlocProvider(create: (_) => di.getIt<CurrentWeatherBloc>()),
      BlocProvider(create: (_) => di.getIt<WeatherForecastBloc>()),
      BlocProvider(create: (_) => di.getIt<BackgroundImageBloc>()),
    ];
