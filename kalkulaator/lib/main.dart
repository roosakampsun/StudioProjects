import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulaator/screen/first_screen.dart';
import 'package:kalkulaator/view/Kalkulaator2.dart';
import 'package:kalkulaator/view/Konverter1.dart';


import 'package:kalkulaator/view/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //Muutumatu osa!!

@override
  Widget build(BuildContext context) {
         return MaterialApp(
           home: FirstScreen(title: 'FirstScreen',),
         routes: {
             routes.kalkulaator:(context) => Kalkulaator2(),
           routes.konverter:(context) => Konverter1App(),


         }


         );


  }

 }
