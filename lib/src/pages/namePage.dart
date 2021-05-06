import 'package:flutter/material.dart';
import 'package:flutter_2parcial/src/pages/menuPage.dart';

TextEditingController textoController = TextEditingController();
TextEditingController resultController = TextEditingController();

class NamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ORDENAMIENTO DE NOMBRE')),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Introduce tu nombre", labelText: "NOMBRE"),
            controller: textoController,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            keyboardType: TextInputType.number,
            // obscureText: true, because it's a password
            decoration: InputDecoration(
                hintText: "Resultado", labelText: "RESULTADO", enabled: false),
            controller: resultController,
          ),
          SizedBox(
            height: 20,
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
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () {
                resultController.text = sortAlphabet(textoController.text);
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
                  textoController.text = '';
                  resultController.text = '';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuPage(),
                      ));
                },
              ))
        ]),
      ),
    );
  }
}

String sortAlphabet(String texto) {
  final List<String> nombre = [];
  String resultado = '';
  texto = texto.toLowerCase();
  for (int i = 0; i < texto.length; i++) {
    var char = texto[i];
    nombre.add(char);
  }
  nombre.sort();
  for (int i = 0; i < nombre.length; i++) {
    resultado += nombre[i];
  }
  resultado.trim();
  return resultado;
}
