import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';
import 'package:iedc_submit_agri/api-calls.dart';
import 'package:iedc_submit_agri/pages/suggestion.dart';
import 'package:weather/weather.dart';
import 'package:iedc_submit_agri/pages/test1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Weather _weather;
  bool _isLoading = true;

  late String temp;
  late String wind;
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
        backgroundColor: Colors.green,
        title: const Text("Agri"),
      ),
      body: _isLoading? Center(
        child: CircularProgressIndicator(),
      ):Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            //${_weather.rain?.lastHour?.toString() ?? "0"}
            InfoPanal(temp: '${_weather.temperature?.celsius?.toStringAsFixed(2)}°C', wind: '${_weather.windSpeed.toString()} m/s', rain: '',),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Get.to(const SuggestionPage());
              },
              child: Card(
                color: Colors.green,
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.energy_savings_leaf),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Suggestions",
                        style: TextStyle(color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 9,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Gallary(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(WeatherApp());
              },
              child: const SizedBox(
                width: 200,
                height: 70,
                child: Center(
                  child: Text(
                    "Get Data",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}

class Gallary extends StatefulWidget {
  const Gallary({Key? key}) : super(key: key);

  @override
  State<Gallary> createState() => _GallaryState();
}

class _GallaryState extends State<Gallary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.grey,
    );
  }
}

class InfoPanal extends StatelessWidget {
  late String temp;
  late String wind;
  late String rain;
  InfoPanal({required this.temp,required this.wind,required this.rain,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100 + 100,
      child: Card(
        elevation: 20,
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardA(color: Colors.orange, num: " ${temp}°C", main: "Temperature"),
                  CardA(color: Colors.blue, num: "${rain}", main: "Rainfall"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardA(color: Colors.red, num: "6.5", main: "pH"),
                  CardA(color: Colors.yellow, num: "${wind} m/s", main: "Wind"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




Widget CardA(
    {required Color color, required String main, required String num}) {
  return Card(
    color: color,
    child: Container(
      height: 70,
      width: 150,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(num),
            Text(main),
          ],
        ),
      ),
    ),
  );
}
