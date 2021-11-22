import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecatsWithCity(cityName: _cityName);
    forecastObject.then((weather) {
      print(weather.list?[0].weather[0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherApp'),
        centerTitle: true,
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_city),
          )
        ],
      ),
      //TODO: Create UI
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Everything is good',
                    style: Theme.of(context).textTheme.headline1,
                  );
                } else {
                  return const Center(
                    child: SpinKitDoubleBounce(
                      color: Colors.black87,
                      size: 100.0,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
