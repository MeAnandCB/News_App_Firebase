import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../controller/fetchNews.dart';
import '../../model/newsArt.dart';
import '../../view/widget/NewsContainer.dart';

class HomeNewsPage extends StatefulWidget {
  HomeNewsPage({super.key});

  @override
  State<HomeNewsPage> createState() => _HomeNewsPageState();
}

class _HomeNewsPageState extends State<HomeNewsPage> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = true;

    late NewsArt newsArt;

    GetNews() async {
      newsArt = await FetchNews.fetchNews();

      setState(() {
        isLoading = false;
      });
    }

    @override
    void initState() {
      GetNews();
      super.initState();
    }

    return PageView.builder(
      controller: PageController(initialPage: 0),
      scrollDirection: Axis.vertical,
      onPageChanged: (value) {
        setState(() {
          isLoading = true;
        });
        GetNews();
      },
      itemBuilder: (context, index) {
        return isLoading
            ? Center(
                child: Lottie.network(
                    'https://assets4.lottiefiles.com/packages/lf20_x62chJ.json'),
              )
            : NewsContainer(
                imgUrl: newsArt.imgUrl,
                newsCnt: newsArt.newsCnt,
                newsHead: newsArt.newsHead,
                newsDes: newsArt.newsDes,
                newsUrl: newsArt.newsUrl);
      },
    );
  }
}
