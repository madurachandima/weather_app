import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/utils/utils.dart';

import '../../../../core/utils/get_weather_icon.dart';
import '../../domain/entities/weather_forecast.dart';

class WeatherForecastSection extends StatelessWidget {
  final List<WeatherForecastElement> weatherElements;

  const WeatherForecastSection({super.key, required this.weatherElements});

  @override
  Widget build(BuildContext context) {
    if (weatherElements.isEmpty) {
      return Container();
    }

    String formattedDate = Utils.getFormattedDate(weatherElements[0].date);
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade900.withOpacity(0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8, top: 8),
              child: Text(
                formattedDate,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: weatherElements
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: _sectionItem(context, e),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _sectionItem(BuildContext context, WeatherForecastElement element) =>
      Column(
        children: [
          Text(
            Utils.getFormattedTime(element.date),
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          if (element.weatherConditionId != null)
            ClipRRect(
              child: SvgPicture.asset(
                getWeatherIcon(element.weatherConditionId!, Utils.isDayTime()),
                fit: BoxFit.cover,
                width: 60,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${element.temp ?? '-'}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "ºC",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "${element.windSpeed ?? '-'}\nkm/h",
            style: const TextStyle(fontSize: 14, color: Colors.white),
          )
        ],
      );
}
