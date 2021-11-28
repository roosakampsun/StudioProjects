import 'package:flutter/material.dart';
import 'theme.dart';
//import 'dart:math';


void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new MaterialApp(
     // title: 'Flutter Kalkulaator2',
      theme: THEME_DATA,
      home: new MyHomePage(title: 'Flutter Kalkulaator2 Application'), // Floating buttons, body
    );
  }

}
class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() =>new _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {
  //tegevused rakenduses, extends state class

  String output = "0"; // muutuja klass, et saada teksti infot kätte
  String _output = "0"; // muutuja output väärtus
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";


  buttonPressed(String buttonText) {
    // saab testida print käskulusega, kas nupp töötab

    if (buttonText == "C") {
      _output = "0"; // muutuja klass, et saada teksti infot kätte
      double num1 = 0.0;
      double num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);

      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Komaga arv, paranda numbrit!");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      // if (operand == "^"){
      // _output = (num1 ^ num2).toString();
      //}


    num1 = 0.0;
    num2 = 0.0;
    operand = "";

  } else {
    _output = _output + buttonText;
  }
  print(_output);

  setState ((){

 output = double.parse(_output).toStringAsFixed(2);

  });
}

  Widget looButton(String buttonText){  //step 2, oluline kasutada korduvalt Expanded ruumi, et mitte korrutada sama ja hoiab koodi optimaalsena
    //saan seda widgetit kutsuda korduvalt ning kasutada, sisu on sama mitme nupuga
    return new Expanded(
      child: new TextButton(
         child: new Text (buttonText, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold
        ),
        ),
        onPressed: () =>
           buttonPressed(buttonText), //lisan ülesande hiljem

      ),
    );
  }
  @override
  //widget implementeerimine
  Widget build(BuildContext context) {

    return new Scaffold(// alati

      appBar: new AppBar(//alati
        title: new Text(widget.title),
        ),
        //User interfcase container algab
        body: new Container( //siia lisan enda user interface  //childe saab olla nii palju, kui ma tahan ja see on widgetite list
      child : new Column(children: <Widget>[  //loon tulba, et sisestada andmed
        new Container (
          child : new Text(output, style: new TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold))

        ),

                new Expanded(
                  child: new Divider(),
                ),

            new Column(children: [
                new Row(children: [
                  looButton("7"),
                looButton("8"),
                looButton("9"),
                looButton("/")
                ]),


            new Row( children: [
              looButton("4"),
              looButton("5"),
              looButton("6"),
              looButton("x"),

            ]), // c
            new Row( children: [
              looButton("1"),
              looButton("2"),
              looButton("3"),
              looButton("-")

            ]), // c
            new Row( children: [
              looButton("."),
              looButton("0"),
              looButton("00"),
              looButton("+")

            ]) ,// c
            new Row( children: [
              looButton("C"),
              looButton("^"),
              looButton("="),

              ]) ,// children kinni
            ])
        ],)
      ));
   // throw UnimplementedError();
  }
}







