import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/core/utils/get_weather_icon.dart';
import 'package:weather_app/core/utils/utils.dart';

import '../../domain/entities/weather.dart';

class CurrentWeatherStatus extends StatelessWidget {
  final Weather weather;

  const CurrentWeatherStatus({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (weather.weatherConditionId != null)
          ClipRRect(
            child: SvgPicture.asset(
              getWeatherIcon(weather.weatherConditionId!, Utils.isDayTime()),
              fit: BoxFit.cover,
              width: 180,
            ),
          ),
        // const Text(
        //   "May 05",
        //   style: TextStyle(
        //     fontSize: 40,
        //     color: Colors.white,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // const Text(
        //   "Updated 05/05/2025 - 10.59 AM",
        //   style: TextStyle(
        //     fontSize: 18,
        //     color: Colors.white,
        //   ),
        // ),
        Text(
          weather.weatherCondition ?? "",
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (weather.temp != null)
                Text(
                  weather.temp!.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const Text(
                "ºC",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
