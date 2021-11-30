import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/location.dart';

class WeatherApi {
  //Получаем объект по названию города
  Future<WeatherForecast> fetchWeatherForecats(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocations();

    Map<String, String?> parametrs;

    if (isCity == true && cityName != null) {
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName
      };
      parametrs = queryParametrs;
    } else {
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString()
      };
      parametrs = queryParametrs;
    }
    //Параметры для url

    //Формируем Uri с помощью констант и параметров запроса
    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parametrs);
    log('request: ${uri.toString()}');
    //Получаем ответ
    var response = await http.get(uri);
    print('response: ${response.body}');

    if (response.statusCode == 200) {
      //Формируем объект из полученного ответа
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
