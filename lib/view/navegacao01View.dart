import 'package:Change4Life/helper/navegacaoHelper.dart';
import 'package:Change4Life/view/navegacao02View.dart';
import 'package:flutter/material.dart';

class Navegacao01View extends StatefulWidget {
  @override
  _Navegacao01ViewState createState() => _Navegacao01ViewState();
}

class _Navegacao01ViewState extends State<Navegacao01View> {
  final _controladorNome = TextEditingController();
  final _controladorIdade = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Navegação 01"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _controladorNome,
                decoration: InputDecoration(labelText: "Nome", hintText: "Nome"),
              ),
              TextFormField(
                controller: _controladorIdade,
                decoration: InputDecoration(labelText: "Idade"),
                validator: (texto) {
                  int idadeDigitada = int.parse(_controladorIdade.text);

                  if (idadeDigitada < 20) {
                    return "Digite uma idade maior do que 20";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Senha"),
              ),
              RaisedButton(
                child: Text("Validar dados"),
                onPressed: () {
                  bool passouValidacao = _formKey.currentState.validate();
                  print(passouValidacao);
                },
              ),
              RaisedButton(
                child: Text("Navegar para view 02 passando parâmetro"),
                onPressed: () {
                  Route rota = MaterialPageRoute(
                      builder: (context) => Navegacao02View(
                            texto: "Raphael",
                            idade: 30,
                          ));

                  Navigator.of(context).push(rota);
                },
              ),
              SizedBox(height: 30),
              RaisedButton(
                child: Text("Navegar para view 02 SEM parâmetro (ROUTE)"),
                onPressed: () {
                  Navigator.of(context).pushNamed(NavegacaoHelper.rotaNavegacao02, arguments: null);
                },
              ),
              SizedBox(height: 30),
              RaisedButton(
                child: Text("Navegar para view 02 COM parâmetro (ROUTE)"),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    NavegacaoHelper.rotaNavegacao02,
                    arguments: {"nome": _controladorNome.text, "idade": int.parse(_controladorIdade.text)},
                  );
                },
              ),
              SizedBox(height: 30),
              RaisedButton(child: Text("Voltar via comando"), 
              onPressed: () {
                  Navigator.of(context).pushNamed(NavegacaoHelper.rotaPrincipal, arguments: null);
              },),
            ],
          ),
        ),
      ),
    );
  }
}
