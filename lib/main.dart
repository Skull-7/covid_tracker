import 'package:covid_tracker/View/splash_screen.dart';
//import 'package:covid_tracker/View/world_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white)
        )
      ),
      home: SplashScreen(),
    );
  }
}

