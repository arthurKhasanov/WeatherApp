import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var forecastList = snapshot.data?.list;
    //Переменная со строкой url иконки
    var icon = forecastList?[0].getIconUrl();
    //Строка температуры в цельсии 
    var temp = forecastList?[0].temp.day.toStringAsFixed(0);
    //Строка с писанием погоды
    var description = forecastList?[0].weather[0].description.toUpperCase();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          icon!,
          scale: 0.5,
          color: Colors.black87,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(
              '$temp °C',
              style: const TextStyle(fontSize: 54, color: Colors.black87),
            ),
            Text(
              '$description',
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            )
          ],
        )
      ],
    );
  }
}
