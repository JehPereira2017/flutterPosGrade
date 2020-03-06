import 'package:flutter/material.dart';

class Navegacao02View extends StatefulWidget {
  final String texto;
  final int idade;

  Navegacao02View({this.texto, this.idade});

  @override
  _Navegacao02ViewState createState() => _Navegacao02ViewState();
}

class _Navegacao02ViewState extends State<Navegacao02View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navegação 02"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.texto ?? "", style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Text(widget.idade?.toString() ?? "", style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.red)),
            SizedBox(height: 30),
            RaisedButton(
              child: Text("Voltar via comando"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
