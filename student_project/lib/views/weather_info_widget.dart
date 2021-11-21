import 'package:flutter/widgets.dart';
import 'package:student_project/models/weather_info.dart';
import 'package:flutter/material.dart';
import 'package:student_project/integrations/weather_api.dart';

class  WeatherInfoWidget extends StatefulWidget {
  // peab andmeid muutma.
  //2. tund uue objekti genereerimiseks tegime stateful, sest sisu muutub


  const WeatherInfoWidget(this.weatherInfo, {Key? key,}) : super(key: key);

//Weather w = Weather(10, location:"Tln") niiviisi anname kaasa andmeid flutteri jaoks

  State<StatefulWidget> createState() => WeatherInfoWidgetState(); //standard State peab olema kui on stateful widget
}

class WeatherInfoWidgetState extends State<WeatherInfoWidget> {
  late Future<WeatherInfo> weatherInfoFuture;


  @override
  void initState() {
    weatherInfoFuture = WeatherRetriever.getWeatherInfoFromWeatherApi();
    super.initState();
  }


  Widget build(BuildContext context) {
  //  WeatherInfo weatherInfo = WeatherRetriever.getDummyWeather(); //tagastab meie weatherinfo viewst ja vastuse controllerist.
    return Column(
      //hakkan tegema teksti elemente, mis minu testraamistik näitab.
      //UI, mida me näitame, see ei muutu isegi, kui me lisame funktsioone retrieverisse
      children:[

          Center (child:Padding(
            padding: const EdgeInsets.only(top:58), // ülemise rea laiendus
            child: weatherInfoFuture,
    builder: (BuildContext context, AsyncSnapshot<WeatherInfo> snapshot) {
    List<Widget> widgets = [];
    VoidCallback? onButtonPress;
    if (snapshot.connectionState == ConnectionState.waiting) {
    onButtonPress = null;
    } else {
    onButtonPress = () {
    setState(() {
    weatherInfoFuture = WeatherRetriever.getWeatherInfoFromWeatherApi();
    });
    };
    }


    widgets.add(ElevatedButton(onPressed: onButtonPress, child: Text("Refresh")));
    if (snapshot.connectionState == ConnectionState.waiting) {
    widgets.add(Text("Loading..."));
    } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
    String weatherDataStr = snapshot.data?.toString() ?? "";
    SharedPreferencesController().setString(DateTime.now().toString(), weatherDataStr);
    widgets.add(Column(
    children: [
    Text(snapshot.data?.location ?? "", style: Theme.of(context).textTheme.bodyText2),
    Text(snapshot.data?.temperature.toString() ?? "", style: Theme.of(context).textTheme.headline2),
    Text(snapshot.data?.condition.text ?? "", style: Theme.of(context).textTheme.headline6)
    ],
    ));
    }
    return Column(
    children: widgets,
    );

    ///Text("Error getting weather data");
    }),
),
)
],
);
// Siia sai loodud uus void funktsioon, mis ei tagasta midagi, kuid teeb ära vajaliku listi loomise, listi uuendamise ja salvestamise
//

}
}

