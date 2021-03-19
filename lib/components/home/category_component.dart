import 'package:flutter/material.dart';

class CategoryComponent extends StatefulWidget {
  @override
  _CategoryComponentState createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryComponent> {
  final List<String> categories = ["WORK", "STUDIES", "HOME"];
  int _categoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          disabledColor: Colors.white30,
          onPressed: _categoryIndex > 0 ? selectBack : null
        ),
        Text(categories[_categoryIndex],
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w300,
            color: Colors.white
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          color: Colors.white,
          disabledColor: Colors.white30,
          onPressed: _categoryIndex < 2 ? selectForward : null
        )
      ],
    );
  }

  void selectForward() {
    setState(() {
      _categoryIndex++;
    });
  }

  void selectBack() {
    setState(() {
      _categoryIndex--;
    });
  }
}
