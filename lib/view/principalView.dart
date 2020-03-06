import 'package:Change4Life/helper/navegacaoHelper.dart';
import 'package:Change4Life/view/navegacao01View.dart';
import 'package:flutter/material.dart';

class PrincipalView extends StatefulWidget {
  @override
  _PrincipalViewState createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change4Life"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Ir para view 01"),
              onPressed: () {
                Route rota = MaterialPageRoute(builder: (context) => Navegacao01View());
                Navigator.of(context).push(rota);
              },
            ),
            RaisedButton(
              child: Text("Ir para view 01 (ROUTE)"),
              onPressed: () {
                Navigator.of(context).pushNamed(NavegacaoHelper.rotaNavegacao01);
              },
            ),
            SizedBox(height: 30),
            RaisedButton(
              child: Text("Ir para rota inexistente"),
              onPressed: () {
                Navigator.pushNamed(context, "XYZ_ROTA_NAO_EXISTE_123");
              },
            ),
          ],
        ),
      ),
    );
  }
}
