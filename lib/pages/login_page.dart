import 'package:flutter/material.dart';
import 'package:flutter_app_animations/components/login/btnAnimation_component.dart';
import 'package:flutter_app_animations/components/login/form_component.dart';
import 'package:flutter_app_animations/components/login/signUpBtn_component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpeg"),
            fit: BoxFit.cover
          )
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 70,
                        bottom: 32
                      ),
                      child: Image.asset("images/logo.png",
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain
                      ),
                    ),
                    FormComponent(),
                    SignUpBtnComponent()
                  ],
                ),
                BtnAnimationComponent(
                  animationController: _animationController.view,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
