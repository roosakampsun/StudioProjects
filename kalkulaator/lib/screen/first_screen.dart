import 'package:flutter/material.dart';
import 'package:kalkulaator/view/routes.dart';



class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text('Simple App')),

            body: Container(
           decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/arvuti.jpg'),
            fit: BoxFit.cover,
          )

        )
      ),
      drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Application List'),
            ),
            ListTile(
              title: const Text('Kalkulaator2'),
              onTap: () {

                Navigator.pushReplacementNamed(context, routes.kalkulaator);
              },
            ),
            ListTile(
              title: const Text('Konverter1'),
              onTap: () {

                Navigator.pushReplacementNamed(context, routes.konverter);
              },
            ),
          ],
        ),
      ),
    );
  }

}
