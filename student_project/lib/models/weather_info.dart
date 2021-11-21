import 'dart:convert';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:student_project/models/weather_info.dart';


class WeatherInfo {

  double temperature;
 //Wind wind;
  String location;
  Condition condition; //muutujad oluline, kui me tahame seda kasutada nagu stringi, teeme pigem selle klassiks, kui kasutame ENUM loetelu
//this.wind//

  WeatherInfo(this.temperature, this.location, this.condition); //objekt, mis tuvastab temperature väärtuse
}

Map<String, dynamic> toJson(){

  double temperature;
    String location;
  Condition : condition.toJson()
};

WeatherInfo.fromJson(Map<string, dynamic>){
  :temperature = json[]




@override
// info saatmine serverisse, JSON-i kaudu serialization-Encode,
String toString(){
  //TODO: implement
  return jsonEncode(this);
  // teeme objektist JSONI, mis sisaldab kõik andmeid
  //JSON objektiks deserialization-Decode

}

static WeatherInfo fromString(String WeatherString){
  return jsonDecode(weatherString);
}

// WIND EI KASUTANUD HILJEM LIHTSALT
//class Wind {

  //double speed; //muutuja
  //Direction direction;
  //string direction; // saab seda kasutada, kuid me kasutasime enum tüüpi
//Wind(this.speed, this.direction);//Sama nagu kirjutasime laravelis pikemalt, dart kirjutab kokku, mida võtta
//}

//enum Direction{ N, S, E, W, NNE, NE,ENE, ESE, SE, SSE, SSW, SW, WSW, WNW, NW, NNW, UNKNOWN }
  //loetelu
  //Direction directionFromString(String dir) {
//return EnumToString.fromString(Direction.values, dir) ?? Direction.UNKNOWN;
//}

// Keerulisemate objektide korral on vaja JSON eraldi objekti sees realiseerida.

class Condition {
String text;

Condition(this.text);

}
 }

// kõik tekst, mis kuvatakse kasutajale peaks olema JSON-is. Keeltevalikute jaoks, et oleks tõlgitud.
//Eraldi paketid, mis installitakse kasutajatele.
//oma Dictionary kasutamiseks