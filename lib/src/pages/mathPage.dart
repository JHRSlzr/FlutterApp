import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_2parcial/src/pages/menuPage.dart';

TextEditingController firstValue = TextEditingController();
TextEditingController secondValue = TextEditingController();
TextEditingController thirdValue = TextEditingController();
TextEditingController x1Value = TextEditingController();
TextEditingController x2Value = TextEditingController();
double dis = 0, aux1 = 0, aux2 = 0, res = 0, real = 0, imag = 0;

class MathPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('FORMULA CUADRÁTICA')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        InputDecoration(hintText: "VALOR DE a", labelText: "A"),
                    controller: firstValue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    // obscureText: true, because it's a password
                    decoration:
                        InputDecoration(hintText: "VALOR DE b", labelText: "B"),
                    controller: secondValue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "VALOR DE c",
                      labelText: "C",
                    ),
                    controller: thirdValue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "VALOR DE X1",
                        labelText: "VALOR X1",
                        enabled: false),
                    controller: x1Value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "VALOR DE X2",
                        labelText: "VALOR X2",
                        enabled: false),
                    controller: x2Value,
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
                        doOperation();
                      },
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 80.0),
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
                          thirdValue.text = '';
                          x1Value.text = '';
                          x2Value.text = '';
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

void doOperation() {
  double a = double.parse(firstValue.text);
  double b = double.parse(secondValue.text);
  double c = double.parse(thirdValue.text);
  dis = b * b - 4 * a * c;
  real = -b / (2 * a);
  imag = sqrt(-dis) / (2 * a);

  if (dis > 0) {
    aux1 = ((-1 * b) + sqrt(dis)) / (2 * a);
    aux2 = ((-1 * b) - sqrt(dis)) / (2 * a);
    x1Value.text = aux1.toString();
    x2Value.text = aux2.toString();
  } else {
    x1Value.text = real.toString();
    x2Value.text = imag.toString();
  }
}
