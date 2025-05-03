import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/presentation/bloc/current_location/current_location_bloc.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Location')),
      body: BlocBuilder<CurrentLocationBloc, CurrentLocationBlocState>(
        builder: (context, state) {
          if (state is CurrentLocationBlocInitial) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CurrentLocationBloc>().add(FetchLocationEvent());
                },
                child: const Text('Get Current Location'),
              ),
            );
          } else if (state is CurrentLocationBlocLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CurrentLocationBlocLoaded) {
            return Center(
              child: Text(
                  'Latitude: ${state.position.latitude}\nLongitude: ${state.position.longitude}\nAddress: ${state.position.locationName}'),
            );
          } else if (state is CurrentLocationBlocError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Container();
        },
      ),
    );
  }
}
