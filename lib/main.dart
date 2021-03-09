import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      debugShowCheckedModeBanner: false,
      home: LogoApp()
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation<double> animation;
  Animation<double> animation2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GrowTransition(
          child: LogoWidget(),
          animation: animation,
        ),
        GrowTransition(
          child: LogoWidget(),
          animation: animation2,
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2)
    );

    animation = Tween<double>(
      begin: 0,
      end: 300
    ).animate(animationController);

    animation2 = Tween<double>(
        begin: 0,
        end: 150
    ).animate(animationController);

    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        animationController.reverse();
      } else if(status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animation2.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        animationController.reverse();
      } else if(status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogo();
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
