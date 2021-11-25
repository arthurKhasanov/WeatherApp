import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';


class ForecastCard extends StatelessWidget {
  ForecastCard({Key? key, required this.snapshot, required this.index}) : super(key: key);
  AsyncSnapshot<WeatherForecast> snapshot;
  int index;


  @override
  Widget build(BuildContext context) {

    var forecastList = snapshot.data!.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt * 1000);
  var fullDay = Util.getFormattedDate(date);
  dayOfWeek = fullDay.split(',')[0];
  var tempMin = forecastList[index].temp.min.round();
  var icon = forecastList[index].getIconUrl();

    return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            dayOfWeek,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '$tempMin °C',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Image.network(icon, scale: 1.2, color: Colors.white),
                ],
              )
            ],
          )
        ],
      )
    ],
  );
  }
}
