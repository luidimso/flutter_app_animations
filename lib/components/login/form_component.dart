import 'package:flutter/material.dart';
import 'package:flutter_app_animations/components/login/input_component.dart';

class FormComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Form(
        child: Column(
          children: <Widget>[
            InputComponent(
              hint: "Username",
              password: false,
              icon: Icons.person_outline,
            ),
            InputComponent(
              hint: "Password",
              password: true,
              icon: Icons.lock_outline
            )
          ],
        ),
      ),
    );
  }
}
