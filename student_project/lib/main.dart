import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_project/views/theme.dart';
import 'package:student_project/views/weather_info_widget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //Muutumatu osa!!

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather app',
      theme: THEME_DATA,
      home: const Navigator (pages: [MaterialPage(key: "Home", child: MyHomePage(title: 'Weather App' ))]
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key); // Muutuv osa widgetid, mis paiknevad sees- kõrval



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),

      body: WeatherInfoWidget()



            );

  }
}
