import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/core/common/app_icon.dart';

import '../../domain/entities/weather.dart';

class WeatherDetailsSection extends StatelessWidget {
  final Weather weather;

  const WeatherDetailsSection({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _weatherDetailsItem(
            icon: AppIcon.humidity,
            title: "HUMIDITY",
            value: "${weather.humidity ?? '-'}%"),
        _weatherDetailsItem(icon: AppIcon.wind, title: "WIND", value: "${weather.windSpeed ?? '-'} km/h"),
        _weatherDetailsItem(
            icon: AppIcon.temp, title: "FEELS LIKE", value: "${weather.temp ?? '-'}"),
      ],
    );
  }

  Widget _weatherDetailsItem(
      {required String icon, required String title, required String value}) {
    return Column(
      children: [
        SvgPicture.asset(icon),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }
}
