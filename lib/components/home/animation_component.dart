import 'package:flutter/material.dart';
import 'package:flutter_app_animations/components/home/animatedList_component.dart';
import 'package:flutter_app_animations/components/home/fade_component.dart';
import 'package:flutter_app_animations/components/home/homeHeader_component.dart';

class AnimationComponent extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> containerGrow;
  final Animation<EdgeInsets> listSliderPosition;
  final Animation<Color> fadeAnimation;

  AnimationComponent({@required this.animationController}) :
      containerGrow = CurvedAnimation(
        parent: animationController,
        curve: Curves.ease
      ),
      listSliderPosition = EdgeInsetsTween(
        begin: EdgeInsets.only(bottom: 0),
        end: EdgeInsets.only(bottom: 80)
      ).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.325, 0.8,
          curve: Curves.ease
        )
      )),
      fadeAnimation = ColorTween(
        begin: Color.fromRGBO(247, 67, 106, 1.0),
        end: Color.fromRGBO(247, 67, 106, 0.0),
      ).animate(CurvedAnimation(
        parent: animationController,
        curve: Curves.decelerate
      ));

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
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            HomeHeader(
              containerGrow: containerGrow
            ),
            AnimatedListComponent(
              listSliderPosition: listSliderPosition,
            )
          ],
        ),
        IgnorePointer(
          child: FadeComponent(
            fadeAnimation: fadeAnimation,
          ),
        )
      ],
    );
  }
}
