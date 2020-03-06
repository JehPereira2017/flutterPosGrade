import 'package:flutter/material.dart';
import 'styles.dart';
import 'loginAnimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../Componentes/SignInButton.dart';
import '../Componentes/SignUpLink.dart';
import '../Componentes/FormLogin.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;
  @override
  void initState() {
    super.initState();

    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Are you sure?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/navegacao01"),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
            body: new Container(
          decoration: new BoxDecoration(
            image: backgroundImage,
          ),
          child: new Center(
              child: new ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(30.0),
                  children: <Widget>[
                new Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new FormContainer(),
                        SizedBox(height: 20),
                        animationStatus == 0
                            ? new Padding(
                                padding: const EdgeInsets.only(bottom: 50.0),
                                child: new InkWell(
                                    onTap: () {
                                      setState(() {
                                        animationStatus = 1;
                                      });
                                      _playAnimation();
                                    },
                                    child: new SignIn()),
                              )
                            : new StaggerAnimation(
                                buttonController: _loginButtonController
                                    .view), //SizedBox.shrink(),
                        new SignUp()
                      ],
                    ),
                  ],
                )
              ])),
        )));
  }
}
