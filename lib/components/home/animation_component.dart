import 'package:flutter/material.dart';
import 'package:flutter_app_animations/components/home/homeHeader_component.dart';

class AnimationComponent extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> containerGrow;

  AnimationComponent({@required this.animationController}) :
      containerGrow = CurvedAnimation(
        parent: animationController,
        curve: Curves.ease
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: animationController,
          builder: _buildAnimation,
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return ListView(
      children: <Widget>[
        HomeHeader(
            containerGrow: containerGrow
        )
      ],
    );
  }
}
