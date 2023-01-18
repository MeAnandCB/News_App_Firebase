import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../controller/fetchNews.dart';
import '../model/newsArt.dart';
import '../widget/NewsContainer.dart';

class HomeNewsPage extends StatefulWidget {
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

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: Container(height: 250, child: Image.asset("assets/img/bg.png")),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Profile",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
