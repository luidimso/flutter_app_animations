import 'package:flutter/material.dart';

class FadeComponent extends StatelessWidget {
  final Animation<Color> fadeAnimation;

  FadeComponent({this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "fade",
        child: Container(
          decoration: BoxDecoration(
            color: fadeAnimation.value
          ),
        )
    );
  }
}
