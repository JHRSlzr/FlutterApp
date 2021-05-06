import 'package:flutter/material.dart';
import 'package:flutter_2parcial/src/pages/homePage.dart';
import 'package:flutter_2parcial/src/pages/mathPage.dart';
import 'package:flutter_2parcial/src/pages/namePage.dart';
import 'package:flutter_2parcial/src/pages/randomPage.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MENÚ PRINCIPAL')),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('OPCIÓN 1'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  onPrimary: Colors.black,
                  shadowColor: Colors.grey,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MathPage(),
                      ));
                },
              ),
              ElevatedButton(
                child: Text('OPCIÓN 2'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NamePage(),
                      ));
                },
              ),
              ElevatedButton(
                child: Text('OPCIÓN 3'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RandomPage(),
                      ));
                },
              ),
                        Container(
              margin: const EdgeInsets.only(top: 150.0),
              child: ElevatedButton(
                child: Text('REGRESAR A LA PANTALLA DE INICIO'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 5,
                ),
                onPressed: () {
                  textoController.text = '';
                  resultController.text = '';
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                },
              ))
            ]),
      ),
    );
  }
}
