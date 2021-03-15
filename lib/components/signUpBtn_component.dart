import 'package:flutter/material.dart';

class SignUpBtnComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(
        top: 160
      ),
      onPressed: () {},
      child: Text("Don't have an account? Register",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 15,
          letterSpacing: 0.5
        ),
      ),
    );
  }
}
