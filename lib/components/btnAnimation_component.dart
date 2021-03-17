import 'package:flutter/material.dart';

class BtnAnimationComponent extends StatelessWidget {
  final AnimationController animationController;

  BtnAnimationComponent({this.animationController});

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
        onTap: () {},
        child: Container(
          width: 320,
          height: 69,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(247, 67, 106, 1.0),
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Text("Sign in",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.3
            ),
          ),
        ),
      ),
    );
  }
}
