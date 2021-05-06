import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:flutter_2parcial/src/pages/menuPage.dart';

TextEditingController firstValue = TextEditingController();
TextEditingController secondValue = TextEditingController();
TextEditingController resultValue = TextEditingController();

class RandomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('NÚMEROS ALEATORIOS')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "VALOR MÍNIMO", labelText: "MÍNIMO"),
                    controller: firstValue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    // obscureText: true, because it's a password
                    decoration: InputDecoration(
                      hintText: "VALOR MÁXIMO",
                      labelText: "MÁXIMO",
                    ),
                    controller: secondValue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "RESULTADO",
                        labelText: "Número Random",
                        enabled: false),
                    controller: resultValue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      child: Text('RESOLVER'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                        shadowColor: Colors.grey,
                        elevation: 5,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      ),
                      onPressed: () {
                        randomizerNumber();
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 150.0),
                      child: ElevatedButton(
                        child: Text('REGRESAR'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          onPrimary: Colors.white,
                          shadowColor: Colors.grey,
                          elevation: 5,
                        ),
                        onPressed: () {
                          firstValue.text = '';
                          secondValue.text = '';
                          resultValue.text = '';
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuPage(),
                              ));
                        },
                      ))
                ]),
          ),
        ));
  }
}

void randomizerNumber() {
  Random random = new Random();
  int randomNumber = random.nextInt(
          (int.parse(secondValue.text) - int.parse(firstValue.text)) + 1) +
      int.parse(firstValue.text);
  resultValue.text = randomNumber.toString();
}
