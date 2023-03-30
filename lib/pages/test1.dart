import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iedc_submit_agri/api-calls.dart';
import 'package:weather/weather.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Weather _weather;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeatherData();
  }

  // Function to load the weather data for the user's current location
  void _loadWeatherData() async {
    Position position = await getCurrentLocation();
    Weather weather = await getCurrentWeather(position);
    setState(() {
      _weather = weather;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Current Temperature: ${_weather.temperature?.celsius.toString()}°C',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Wind Speed: ${_weather.windSpeed.toString()} m/s',
            style: TextStyle(fontSize: 24),
          ),
          // Text(
          //   'Rainfall: ${_weather.rain?.lastHour?.toString() ?? "0"} mm',
          //   style: TextStyle(fontSize: 24),
          // ),
        ],
      ),
    );
  }
}
