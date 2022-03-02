import 'package:dailytasksssss/addTasks/addTasks.dart';
import 'package:dailytasksssss/pageProf/page_pro.dart';
import 'package:dailytasksssss/screens/home/home.dart';
import 'package:flutter/material.dart';

class Indexindex extends StatefulWidget {
  const Indexindex({Key? key}) : super(key: key);

  @override
  _IndexindexState createState() => _IndexindexState();
}

class _IndexindexState extends State<Indexindex> {
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
            ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
          backgroundColor: Colors.black,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AddTasks(),
            barrierDismissible: false,
          ),
          child:const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ));
  }
}
