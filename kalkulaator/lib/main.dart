import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalkulaator/view/theme.dart';



void main() {runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key); //Muutumatu osa!!

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            //ThemeData.colorScheme: Colors.purpleAccent
      theme: THEME_DATA,
      home: LihtneKalkulaator(),  // loome lihtsakalkulaatori objekti
debugShowCheckedModeBanner: false,

    );  // TAGASTAME sisurakenduse

  }
}


class LihtneKalkulaator extends StatefulWidget {
  @override

 // Miks nii ei saanud?
  //State<LihtneKalkulaator> createState() => _LihtneKalkulaatorState();

    _LihtneKalkulaatorState createState() => _LihtneKalkulaatorState();
  }

class _LihtneKalkulaatorState extends State<LihtneKalkulaator> {
  @override
  Widget build(BuildContext context) {  //standard kuidas ehitata üles sisu ja appbari enda rakendusse

      return Scaffold(
      appBar: AppBar(title: const Text('Kalkulaator')),
        body: Container(
          child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25.0),
                alignment: Alignment.bottomRight,
                child: Text(text, style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w500,
                ),
                ),
              ),
            ),
              Row(   //nupud meetodi kaudu ritta tabelisse
              children: <Widget>[
                  customOutlineButton("7"),
                customOutlineButton("8"),
                customOutlineButton("9"),
                customOutlineButton("+"),

                        ],

                      ),
            Row(   //nupud meetodi kaudu ritta tabelisse
              children: <Widget>[
                customOutlineButton("4"),
                customOutlineButton("5"),
                customOutlineButton("6"),
                customOutlineButton("-"),

              ],

            ),
            Row(   //nupud meetodi kaudu ritta tabelisse
              children: <Widget>[
                customOutlineButton("1"),
                customOutlineButton("2"),
                customOutlineButton("3"),
                customOutlineButton("X"),
                Row(   //nupud meetodi kaudu ritta tabelisse
                  children: <Widget>[
                    customOutlineButton("0"),
                    customOutlineButton("C"),
                    customOutlineButton("/"),
                    customOutlineButton("="),

                  ],

                ),

              ],

            ),
],
                    ),
            ),



          );



  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlinedButton(
//funktsioon nupule
                  onPressed: () =>btnClicked(val),
                  child: Text (val, style: TextStyle(fontSize: 35.0),
// lisan val


                  ),
                ),
    );

  }

//defineerin muutujad
late int first, second;
  late String res, text ="";
  late String opp;
  void btnClicked(String buttonText){
    if (buttonText=="C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    }else if(

// juhul kui üks teine kolmas arvutus käitatakse
    buttonText == "+" ||
    buttonText == "-" ||
    buttonText == "x" ||
    buttonText == "/" ) {
      first = int.parse(text);
      res = "";
      opp = buttonText;

    }else if (buttonText == "=") {
    second= int.parse(text);
    if (opp == "+") {
      res=(first + second).toString();
    }
    if (opp == "-") {
      res = (first - second).toString();
    }
    if (opp == "x") {
      res = (first * second).toString();
    }
    if (opp == "/") {
      res = (first ~/ second).toString();
    }
          }else {
      res = int.parse(text + buttonText).toString();
    }

        setState(() {
          text = res; //trükitud teksti set state, numbrid järjestikus lubatud tablool
        });

  }
}
//astmel teha ei osanud