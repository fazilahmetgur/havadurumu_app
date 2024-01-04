
// ignore_for_file: unused_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havadurumu/utils/weather.dart';


class MainScreen extends StatefulWidget {
  final WeatherData weatherData;
  const MainScreen({super.key, required this.weatherData});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late int temperature;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;
  late String city;

  void updateDisplayInfo(WeatherData weatherData){
    setState(() {
      temperature=weatherData.currentTemperature.round();
      WeatherDisplayData weatherDisplayData=weatherData.getWeatherDisplayData();
      backgroundImage=weatherDisplayData.weatherImage;
      weatherDisplayIcon=weatherDisplayData.weatherIcon;
      city=weatherData.currentCity;
    });

  }
  @override
  void initState() {
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:  const BoxConstraints.expand(),
        decoration:  BoxDecoration(
          image: DecorationImage(
          image:backgroundImage,
          fit: BoxFit.cover
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40,),
            Container(
            child: weatherDisplayIcon,
            ),
            const SizedBox(height: 15),
             Center(child: Text("$temperature°", style: const TextStyle(fontSize: 40, letterSpacing: -5))),
             const SizedBox(height: 15),
             Center(child: Text("$city", style: const TextStyle(fontSize: 40, letterSpacing: -2))),
          ],
        ),
      ),
    );

  }
}