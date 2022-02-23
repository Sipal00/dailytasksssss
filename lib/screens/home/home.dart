import 'package:dailytasksssss/screens/home/widgets/go_premium.dart';
import 'package:dailytasksssss/screens/home/widgets/tasks.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GoPremium(),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Tasks",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Tasks(),
            )
          ],
        ),
        // bottomNavigationBar: _buildBottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
          backgroundColor: Colors.black,
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ));
  }

  /* Widget _buildBottomNavigationBar() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10)
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                    label: "Home", icon: Icon(Icons.home_rounded, size: 30)),
                BottomNavigationBarItem(
                    label: "search", icon: Icon(Icons.search, size: 30)),
              ]),
        ));
 */

}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      children: [
        Container(
          height: 45,
          width: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("asset/images/21.jpg"),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          "Hi, Sipal!",
          style: TextStyle(
              color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ],
    ),
    actions: [
      Icon(
        Icons.more_vert,
        color: Colors.black,
        size: 40,
      )
    ],
  );
}
