import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/widgets/buttom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  WeatherForecastScreen({Key? key, required this.locationWeather})
      : super(key: key);
  WeatherForecast locationWeather;

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
    //Получаем объект с погодой
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
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
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecats();
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var tappedCity = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedCity != null) {
                setState(() {
                  _cityName = tappedCity;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecats(cityName: _cityName, isCity: true);
                });
              }
            },
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
                      const SizedBox(height: 50),
                      //Виджет с названием города и датой
                      CityView(snapshot: snapshot),
                      const SizedBox(height: 50),
                      //Виджет с иконкой погоды, погодой и описанием
                      TempView(snapshot: snapshot),
                      const SizedBox(height: 50),
                      //Виджет с давлением, осадками и скоростью ветра
                      DetailView(snapshot: snapshot),
                      const SizedBox(height: 50),
                      //Виджет с карточками погоды на 7 дней
                      BottomListView(snapshot: snapshot),
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
