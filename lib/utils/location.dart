
// ignore_for_file: unused_import, no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationHelper{
  late double latitute;
  late double longitute;

  Future<void>getCurrentLocation() async{
    Location location= Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    //location için servis kontrolü

    _serviceEnabled= await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled=await location.requestService();
      if(!_serviceEnabled){
        return ;
      }

    }

    //Konum izinleri kontrolü

    _permissionGranted= await location.hasPermission();
    if(_permissionGranted==PermissionStatus.denied){
      _permissionGranted=await location.requestPermission();
      if(_permissionGranted!= PermissionStatus.granted){
        return;
      }
    }
   
   _locationData= await location.getLocation();
   latitute=_locationData.latitude!;
   longitute= _locationData.longitude!;

  }
}