import 'package:student_project/integrations/models/weather_api_object.dart';
import 'package:student_project/integrations/weather_api.dart';
import 'package:student_project/models/weather_info.dart';

class WeatherRetriever {
// See osa tegime uuesti, kui tegime uut päris rakendust. 


//kuna koguprotsess on asynkroonne, tagastame future

  //static- kohapealne väärtus, mujal pm ei kasuta, return ka alati
static Future<WeatherInfo> getWeatherInfoFromWeatherApi() async { //saab objekti WeatherApiIntegration.getWeatherInfo(); ja tagastab WeatherInfo
WeatherApiObject weatherApiObject = await WeatherApiIntegration.getWeatherInfo();
return _convertWeatherApiToWeatherInfo(weatherApiObject);

 }
static WeatherInfo _convertWeatherApiToWeatherInfo(WeatherApiObject weatherApiObject) {
  Wind wind =
    Wind(weatherApiObject.currentWeather.windKph, directionFromString(weatherApiObject.currentWeather.windDir));



  WeatherInfo weatherInfo = WeatherInfo(weatherApiObject.currentWeather.tempCelsius, wind,
      weatherApiObject.location.name, Condition(weatherApiObject.currentWeather.condition.text));
  return weatherInfo;





  }

}