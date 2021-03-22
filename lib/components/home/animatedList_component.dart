import 'package:flutter/material.dart';
import 'package:flutter_app_animations/components/home/listData_component.dart';

class AnimatedListComponent extends StatelessWidget {
  final Animation<EdgeInsets> listSliderPosition;

  AnimatedListComponent({@required this.listSliderPosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListDataComponent(
          title: "Test",
          subtitle: "Test",
          image: AssetImage("images/perfil.jpeg"),
          margin: listSliderPosition.value,
        ),
        ListDataComponent(
          title: "Test 2",
          subtitle: "Test 2",
          image: AssetImage("images/perfil.jpeg"),
          margin: listSliderPosition.value * 0,
        )
      ],
    );
  }
}
