import 'package:flutter/material.dart';

class BtnAnimationComponent extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> buttonAnimation;

  BtnAnimationComponent({this.animationController}) : buttonAnimation = Tween(
    begin: 320.0,
    end: 60.0
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Interval(0.0, 0.15)
  ));

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: _buildAnimation
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          animationController.forward();
        },
        child: Container(
          width: buttonAnimation.value,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(247, 67, 106, 1.0),
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: _buildInsideBtn(context),
        ),
      ),
    );
  }

  Widget _buildInsideBtn(BuildContext context) {
    if(buttonAnimation.value > 75) {
      return Text("Sign in",
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3
        ),
      );
    } else {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1,
      );
    }
  }
}
