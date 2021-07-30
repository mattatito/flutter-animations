import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final EdgeInsets margin;

  ListData({
    @required this.title,
    @required this.subtitle,
    @required this.image,
    @required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey[100], width: 1.0),
            bottom: BorderSide(color: Colors.grey[100], width: 1.0),
          )),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle, image: DecorationImage(image: image)),
          ),
          Wrap(
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ])
        ],
      ),
    );
  }
}
