import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/current_location/current_location_bloc.dart';

import 'injection_container.dart' as di;

get blocProviders => [
      BlocProvider(create: (_) => di.getIt<CurrentLocationBloc>()),
    ];
