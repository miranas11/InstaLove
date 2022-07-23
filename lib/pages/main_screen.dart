import 'package:dating/pages/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dating/components/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String id = "main_screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

double height = 0;
double width = 0;

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    height = getHeight(context);
    width = getWidth(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.settings,
              color: kPurpleColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: const [SearchScreen()],
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: kBackgroundColor,
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.multitrack_audio_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_rounded),
          )
        ],
      ),
    );
  }
}
