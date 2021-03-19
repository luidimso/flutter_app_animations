import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_animations/components/home/category_component.dart';

class HomeHeader extends StatelessWidget {
  final Animation<double> containerGrow;

  HomeHeader({@required this.containerGrow});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpeg"),
          fit: BoxFit.cover
        )
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Welcome, Luidi!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.white
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              height: containerGrow.value * 120,
              width: containerGrow.value * 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("images/perfil.jpeg"),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                height: containerGrow.value * 35,
                width: containerGrow.value * 35,
                margin: EdgeInsets.only(
                    left: 80
                ),
                child: Center(
                  child: Text("2",
                    style: TextStyle(
                        fontSize: containerGrow.value * 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                  )
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(80, 210, 194, 1)
                ),
              ),
            ),
            CategoryComponent()
          ],
        ),
      ),
    );
  }
}
