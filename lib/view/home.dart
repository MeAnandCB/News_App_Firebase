import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp_with_otp/view/widget/NewsContainer.dart';
import '../controller/fetchNews.dart';
import '../model/newsArt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Find Your News Here'),
          backgroundColor: const Color.fromARGB(255, 60, 4, 106),
        ),
        body: SafeArea(
          child: PageView.builder(
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 60, 4, 106),
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Heart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: 0,
        ),
      ),
    );
  }
}
