import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/weather.dart';

// Function to request location permission
Future<bool> requestLocationPermission() async {
  PermissionStatus permission = await Permission.location.request();
  return permission == PermissionStatus.granted;
}

// Function to get the user's current location
Future<Position> getCurrentLocation() async {
  bool permissionGranted = await requestLocationPermission();
  if (!permissionGranted) {
    throw Exception('Location permission denied');
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  return position;
}

// Function to get the current weather data for a location
Future<Weather> getCurrentWeather(Position position) async {
  WeatherFactory weatherFactory = new WeatherFactory("6912fe23f648e95028669919b8c9d857");
  Weather weather = await weatherFactory.currentWeatherByLocation(
      position.latitude, position.longitude);
  return weather;
}