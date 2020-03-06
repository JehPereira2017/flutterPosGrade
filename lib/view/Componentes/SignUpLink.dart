import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp();
  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      // padding: const EdgeInsets.only(
      //   top: 160.0,
      // ),
      onPressed: null,
      child: new Text(
        "Don't have an account? Sign Up",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: new TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 0.5,
            color: const Color.fromRGBO(255, 255, 255, 1.0),
            fontSize: 12.0),
      ),
    );
  }
}
