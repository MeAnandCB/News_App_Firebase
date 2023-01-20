import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../View/webView_Page/Web_View_Page.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;
  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsDes,
      required this.newsCnt,
      required this.newsHead,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              child: Text(
                'Headlines : ',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              newsHead.length > 90
                  ? "${newsHead.substring(0, 90)}..."
                  : newsHead,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            //  color: Colors.amber,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: FadeInImage.assetNetwork(
                    height: MediaQuery.of(context).size.height * .25,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    placeholder: "assets/img/space.jpg",
                    image: imgUrl),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                newsDes,
                style: const TextStyle(
                    fontSize: 12, height: 1.5, color: Colors.black38),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                newsCnt != "--"
                    ? newsCnt.length > 250
                        ? newsCnt.substring(0, 250)
                        : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                    : newsCnt,
                style: const TextStyle(
                    fontSize: 17, height: 1.5, fontWeight: FontWeight.w500),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ]),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 80,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 60, 4, 106),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailViewScreen(newsUrl: newsUrl)));
                  },
                  icon: Icon(Icons.newspaper_rounded),
                  label: Text('Read More')),
            ),
          ),
        ]),
      ),
    );
  }
}
