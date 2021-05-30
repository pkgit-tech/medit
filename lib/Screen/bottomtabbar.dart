import 'package:flutter/material.dart';
import "./homeview.dart";
import "./profileview.dart";
import "./trainingview.dart";
import './otherview.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabbar';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final pageController = PageController();
  final bodyList = [HomeView(), TrainingView(), OtherView(), ProviewView()];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<BottomNavigationBarItem> bottomNavigationitems = [
    BottomNavigationBarItem(
      label: "",
      backgroundColor: Colors.white,
      icon: Image.asset(
        'assets/images/home_med.png',
      ),
      activeIcon: Image.asset('assets/images/home_med.png', color: Colors.blue),
    ),
    BottomNavigationBarItem(
      label: "",
      backgroundColor: Colors.white,
      icon: Image.asset(
        'assets/images/book_med.png',
      ),
      activeIcon: Image.asset('assets/images/book_med.png', color: Colors.blue),
    ),
    BottomNavigationBarItem(
      label: "",
      backgroundColor: Colors.white,
      icon: Image.asset(
        'assets/images/phool_med.png',
      ),
      activeIcon:
          Image.asset('assets/images/phool_med.png', color: Colors.blue),
    ),
    BottomNavigationBarItem(
      label: "",
      backgroundColor: Colors.white,
      icon: Image.asset(
        'assets/images/group_med.png',
      ),
      activeIcon:
          Image.asset('assets/images/group_med.png', color: Colors.blue),
    ),
  ];

  void _selectPage(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: bodyList,
          physics: NeverScrollableScrollPhysics()),
      bottomNavigationBar: BottomNavigationBar(
        //showSelectedLabels: false,
        // showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedPageIndex,
        items: bottomNavigationitems,
      ),
    );
  }
}
