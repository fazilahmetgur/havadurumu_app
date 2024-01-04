// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:havadurumu/screens/loading_page.dart';
import 'package:havadurumu/screens/main_screen.dart';
import 'package:havadurumu/utils/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hava Durumu",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home:  const LoadingPage(),
    );
  }
}

