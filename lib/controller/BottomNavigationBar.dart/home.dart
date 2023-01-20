// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp_with_otp/widget/NewsContainer.dart';
import '../../View/Screens/Home_Screen/HomeNewsPage.dart';
import '../fetchNews.dart';
import '../../model/newsArt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            elevation: 1,
            backgroundColor: const Color.fromARGB(255, 60, 4, 106),
            title: const Text(
              'Exit Confirmation',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              'Do you want to exit the App?',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  //call function on back button press
  int currentindexValue = 0;
  static List<Widget> widgetOptions = <Widget>[
    HomeNewsPage(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () => showExitPopup(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Find Your News Here'),
            backgroundColor: const Color.fromARGB(255, 60, 4, 106),
            actions: const [
              Icon(
                Icons.share,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.favorite_border_sharp,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          body: PageView.builder(
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
          ),
          // body: widgetOptions.elementAt(currentindexValue),
        ),
      ),
    );
  }
}
