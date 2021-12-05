import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulaator/view/Kalkulaator2.dart';
import 'package:kalkulaator/view/Konverter1.dart';
import 'view/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //Muutumatu osa!!

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //routing teisele lehele, kus saab vaadata ajalugu
        '/': (context) => MyHomePage(title: "Simple App",),
           '/history': (context) => Konverter1App(),
      },
      title: "Calculator",
      theme: THEME_DATA,
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title})
      : super(key: key); // Muutuv osa widgetid, mis paiknevad sees- kõrval

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
        body: Kalkulaator2());
  }
}
