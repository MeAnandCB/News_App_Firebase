import 'package:flutter/material.dart';

class NewsContainernew extends StatelessWidget {
  // String imgUrl;
  // String newsHead;
  // String newsDes;
  // String newsUrl;
  // String newsCnt;
  // NewsContainernew(
  // {super.key,
  // required this.imgUrl,
  // required this.newsDes,
  // required this.newsCnt,
  // required this.newsHead,
  // required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Container(
              height: 150,
              width: 150,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
