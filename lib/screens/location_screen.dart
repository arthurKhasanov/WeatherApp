import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationWeather() async {
    var weatherInfo = await WeatherApi().fetchWeatherForecats();

    if (weatherInfo == null) {
      print('Error location_screen $weatherInfo');
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherForecastScreen(locationWeather: weatherInfo);
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.black87, size: 100.0),
      ),
    );
  }
}
