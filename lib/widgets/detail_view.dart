import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list![0];

    var pressure = forecastList!.pressure * 0.770062;
    var humidity = forecastList.humidity;
    var speed = forecastList.speed;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
            pressure.round(), 'mm Hg'),
        Util.getItem(FontAwesomeIcons.cloudRain,
            humidity.round(), '%'),
        Util.getItem(
            FontAwesomeIcons.wind, speed.round(), 'm/s'),
      ],
    );
  }
}
