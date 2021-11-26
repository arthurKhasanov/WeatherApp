import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black87,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    icon: Icon(
                      Icons.location_city,
                      size: 50,
                      color: Colors.black87,
                    )),
                onChanged: (value) {
                  city = value;
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, city);
                },
                child: const Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 30, color: Colors.black87),
                ))
          ],
        ),
      ),
    );
  }
}
