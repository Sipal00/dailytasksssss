import 'package:dailytasksssss/pageProf/page_pro.dart';
import 'package:dailytasksssss/screens/home/home.dart';
import 'package:flutter/material.dart';

class buildBottomNavigationBar extends StatefulWidget {
  const buildBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _buildBottomNavigationBarState createState() =>
      _buildBottomNavigationBarState();
}

class _buildBottomNavigationBarState extends State<buildBottomNavigationBar> {
  List pages = [HomePage(), ProfilePage()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTap,
            currentIndex: currentIndex,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey.withOpacity(0.3),
            items: [
              BottomNavigationBarItem(
                  label: "Home", icon: Icon(Icons.home_rounded, size: 30)),
              BottomNavigationBarItem(
                  label: "Person", icon: Icon(Icons.person_rounded, size: 30)),
            ]));
  }
}
