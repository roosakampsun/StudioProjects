import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:student_project/integrations/models/weather_api_object.dart'; //võtsime pub.dev lehelt juhendistflutterflutter

class WeatherApiIntegration {

    static Future<WeatherApiObject> getWeatherInfo() async{ // lisasin siia objekti tagastamiseks <WeatherApiObject>
      //async mitu protsessi korraga, future protsess tuleviku protsessid hakkavad tööd tegema
      //await ootab kuni midagi juhtub
      //http dart dokumendis on veel selgitusi funktsioonidele
      //asyn ja await kasutatakse järjest
   http.Response response = await http.get(Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=405bdfc525274fb7ae090245213110&q=Tallinn&days=1&aqi=no&alerts=no'));//võetud Weatherforecasti lehelt 4 päeva forecast
   if (response.statusCode == 200) {

     WeatherApiObject object = WeatherApiObject.fromJson(jsonDecode(response.body));
     return object;
   } else {
     // If the server did not return a 200 OK response,
     // then throw an exception.
     throw Exception('Failed to load weather object');
   }
//map ei luba otse kasutada, pean tegema konverteerimise osad
  }
}

// punase täpiga project jääb debugeri juures seisma "Debug käsklus
