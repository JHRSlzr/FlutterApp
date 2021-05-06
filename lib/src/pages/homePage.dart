import 'package:flutter/material.dart';
import 'package:flutter_2parcial/src/pages/menuPage.dart';

import 'package:flutter_2parcial/src/models/user.dart';

TextEditingController nombreController = TextEditingController();
TextEditingController edadController = TextEditingController();
TextEditingController estadoController = TextEditingController();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXAMEN 2DO PARCIAL'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Nombre Completo", labelText: "NOMBRE"),
              controller: nombreController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              // obscureText: true, because it's a password
              decoration: InputDecoration(hintText: "Edad", labelText: "EDAD"),
              controller: edadController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Estado",
                labelText: "ESTADO",
              ),
              controller: estadoController,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("ENTRAR"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                _mostrarAlert(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

_navigateHome(BuildContext context) async {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuPage(),
      ));
}

_mostrarAlert(BuildContext context) {
  User user = new User(
      nombreController.text, edadController.text, estadoController.text);
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('¡BIENVENID@!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                  'Hola, ${user.nombre} tienes ${user.edad} año(s) y eres de ${user.estado} , ¡Qué bien! :)')
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                _navigateHome(context);
              },
            ),
            FlatButton(
                child: Text('CERRAR'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      });
}
