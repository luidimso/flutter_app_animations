import 'package:flutter/material.dart';

class ListDataComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final EdgeInsets margin;

  ListDataComponent({this.title, this.subtitle, this.image, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey[100],
            width: 1
          ),
          bottom: BorderSide(
            color: Colors.grey[100],
            width: 1
          )
        )
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 20,
              right: 20
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: image
              )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ),
              ),
              Text(title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
