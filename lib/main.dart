import 'package:flutter/material.dart';
import 'package:flutter_app_animations/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      debugShowCheckedModeBanner: false,
      // home: LogoApp()
      home: LoginPage()
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

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      child: LogoWidget(),
      animation: animation,
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

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceIn
    );

    animation.addStatusListener((status) {
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
  final size = Tween<double>(
    begin: 0,
    end: 300
  );
  final opacity = Tween<double>(
    begin: 0.1,
    end: 1
  );

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: opacity.evaluate(animation).clamp(0.0, 1.0),
            child: Container(
              height: size.evaluate(animation).clamp(0.0, 300.0),
              width: size.evaluate(animation).clamp(0.0, 300.0),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
