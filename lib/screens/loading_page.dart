
// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:havadurumu/screens/main_screen.dart';
import 'package:havadurumu/utils/location.dart';
import 'package:havadurumu/utils/weather.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late LocationHelper locationData;
  Future<void> getLocationData() async{
    locationData= LocationHelper();
    await locationData.getCurrentLocation();

    if(locationData.latitute==null || locationData.longitute==null){
      // ignore: avoid_print
      print("Konum Bilgileri Gelmiyor !");
    }else{
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print("latitute: "+ locationData.latitute.toString());
      // ignore: prefer_interpolation_to_compose_strings, avoid_print
      print("longitute:"+ locationData.longitute.toString());
    }
  }

  void getWeatherData()async{
    await getLocationData();
    WeatherData weatherData=WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

    if(weatherData.currentTemperature==null || weatherData.currentCondition==null){
      // ignore: avoid_print
      print("API den sıcaklık veya konum biligisi alınamıyor");
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return  MainScreen(weatherData: weatherData);

    }));
  }
  @override
  void initState() {
 
    super.initState();
    getWeatherData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.blue]
          ),
        ),
        child: const Center(
          child: SpinKitFadingCircle(color: Colors.white,
          size: 150,
          duration: Duration(milliseconds: 1200),
          ),
        ),
      ),
    );
  }
}