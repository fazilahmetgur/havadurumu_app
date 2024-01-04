
// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havadurumu/utils/location.dart';
import 'package:http/http.dart';

const apiKey=""; //Kişisel APIKey Girilecek


class WeatherDisplayData{
  late Icon weatherIcon;
  late AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon, required this.weatherImage});

}

class WeatherData{
  WeatherData({required this.locationData });

  LocationHelper locationData;
  late double currentTemperature;
  late int currentCondition;
  late String currentCity;

  Future<void> getCurrentTemperature() async{
    // ignore: unused_local_variable, unnecessary_brace_in_string_interps
    Response response= await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitute}&lon=${locationData.latitute}&appid=${apiKey}&unit=metric"));

    if(response.statusCode==200){
      String data=response.body;
      var currentWeather=jsonDecode(data);

      try{
        currentTemperature=currentWeather['main']['temp'];
        currentCondition=currentWeather['weather'][0]['id'];
        currentCity=currentWeather['name'];
      }catch(e){
        // ignore: avoid_print
        print(e);
      }

    }else{
      // ignore: avoid_print
      print("Apıden sonuç gelmiyor");
    }


  }

  WeatherDisplayData getWeatherDisplayData(){

    if(currentCondition<600){
      return WeatherDisplayData(weatherIcon: const Icon(
        FontAwesomeIcons.cloud,
        size: 75,
        color: Colors.white,
      ),
      
       weatherImage: const AssetImage("assets/cloud.png"));
    }else{

      var now= DateTime.now();
      if(now.hour>=18){
         return WeatherDisplayData(weatherIcon: const Icon(
        FontAwesomeIcons.moon,
        size: 75,
        color: Colors.white,
      ),
      
       weatherImage: const AssetImage("assets/nigth.png"));

      }else{
         return WeatherDisplayData(weatherIcon: const Icon(
        FontAwesomeIcons.sun,
        size: 75,
        color: Colors.white,
      ),
      
       weatherImage: const AssetImage("assets/sun.png"));
      }
    }

  }


}
