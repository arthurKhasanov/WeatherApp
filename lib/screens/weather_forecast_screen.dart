import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  //Объект модели
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    //Получаем объект по городу
    forecastObject =
        WeatherApi().fetchWeatherForecatsWithCity(cityName: _cityName);
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
      
      body: ListView(
        children: [
          Container(
            //Используем FutureBuilder тк получаем объект Future<WeatherForecast>
            child: FutureBuilder<WeatherForecast>(
              //Передаем объект модели
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //Передаем snapshot, который точно имеет данные
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      //Виджет с названием города и датой 
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50),
                      //Виджет с иконкой погоды, погодой и описанием
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50),
                      //Виджет с давлением, осадками и скоростью ветра
                      DetailView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return const Center(
                    //Пока данные не загружены на экране анимация загрузки 
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
