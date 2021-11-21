class WeatherApiObject {

  late _Location location; //tühja väärtust ei saa lisada, kuid on mainitud
  late _CurrentWeather currentWeather; //tühja väärtust ei saa lisada on mainitud

  WeatherApiObject(this.location, this.currentWeather);

  factory WeatherApiObject.fromJson(Map<String, dynamic> json) {
    return WeatherApiObject(_Location.fromJson(json["location"]), _CurrentWeather.fromJSon(json["current"]));
  }

}
  class _Location{ //_ allkriips dartis on sama, mis private class
    String name;
    String region;
    String country;
    double lat;
    double lon;
   // DateTime localTime;

    _Location(this.name, this.region, this.country, this.lat, this.lon);//_ allkriips dartis on sama, mis private class
//2. sisestan muutujad.
  //Factory, et saada andmed kätte jsonist
  //return tagasstame objekti!!

    factory _Location.fromJson(Map<String, dynamic>json){ //see rida on standard
      return _Location(json["name"],json["region"],json["country"],json["lat"],json["lon"]);

    }
  }
  class _CurrentWeather {
    // DateTime lastUpdated; (this.lastUpdated, ) see on liiga lai parameeter, võttis ära
    double tempCelsius;
    _Condition condition; //klassi klassi sees selle parameetri teen eraldi, mis ta siis tegelikult on ja kuidas kasutan
    double windKph;
    String windDir;
    double feelsLikeCelsius; //see ei ole string, väärtus on arv komaga

    _CurrentWeather(this.tempCelsius, this.condition, this.windKph,
        this.windDir, this.feelsLikeCelsius);

    factory _CurrentWeather.fromJSon(Map<String, dynamic> json) {
      return _CurrentWeather(
          json["temp_c"], _Condition.fromJSon(json["condition"]), json["wind_kph"],
          json["wind_dir"], json["feelslike_c"]);
    }
  }
  class _Condition {

    String text;
    _Condition(this.text);


  factory _Condition.fromJSon(Map<String, dynamic> json) {

    return _Condition(json['text']);
  }





}