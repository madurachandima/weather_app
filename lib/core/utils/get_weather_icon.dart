import '../common/weather_icon.dart';

String getWeatherIcon(int conditionCode, bool isDaytime) {
  switch (conditionCode) {
    case 200:
    case 201:
    case 202:
    case 210:
    case 211:
    case 212:
    case 221:
    case 230:
    case 231:
    case 232:
      return WeatherIcon.thunderstorms;

    case 300:
    case 301:
    case 302:
    case 310:
    case 311:
    case 312:
    case 313:
    case 314:
    case 321:
      return isDaytime ? WeatherIcon.rainy1Day : WeatherIcon.rainy1Night;

    case 500:
    case 501:
    case 502:
    case 503:
    case 504:
      return isDaytime ? WeatherIcon.rainy2Day : WeatherIcon.rainy2Night;
    case 511:
      return WeatherIcon.snowAndSleetMix;
    case 520:
    case 521:
    case 522:
    case 531:
      return isDaytime ? WeatherIcon.rainy3Day : WeatherIcon.rainy3Night;

    case 600:
    case 601:
    case 602:
    case 611:
    case 612:
    case 613:
    case 615:
    case 616:
    case 620:
    case 621:
    case 622:
      return isDaytime ? WeatherIcon.snowy1Day : WeatherIcon.snowy1Night;

    case 701:
      return isDaytime ? WeatherIcon.fogDay : WeatherIcon.fogNight;
    case 711:
      return WeatherIcon.haze;
    case 721:
      return isDaytime ? WeatherIcon.hazeDay : WeatherIcon.hazeNight;
    case 731:
    case 751:
    case 761:
      return WeatherIcon.dust;
    case 741:
      return isDaytime ? WeatherIcon.fogDay : WeatherIcon.fogNight;
    case 762:
      return WeatherIcon.dust;
    case 771:
      return WeatherIcon.windIcon;
    case 781:
      return WeatherIcon.tornado;

    case 800:
      return isDaytime ? WeatherIcon.clearDay : WeatherIcon.clearNight;

    case 801:
      return isDaytime ? WeatherIcon.cloudy1Day : WeatherIcon.cloudy1Night;
    case 802:
      return isDaytime ? WeatherIcon.cloudy2Day : WeatherIcon.cloudy2Night;
    case 803:
    case 804:
      return isDaytime ? WeatherIcon.cloudy3Day : WeatherIcon.cloudy3Night;

    default:
      return WeatherIcon.cloudy;
  }
}
