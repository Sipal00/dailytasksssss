import 'package:flutter/material.dart';

class gopremium extends StatelessWidget {
  const gopremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ))
        ]));
  }
}

Widget _buildAppBar(BuildContext context) {
  return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios_new),
        iconSize: 20,
      ),
      actions: [
        Icon(
          Icons.more_vert,
          size: 40,
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tasks",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "You have tasks for today!",
                style: TextStyle(fontSize: 12, color: Colors.grey[700]),
              ),
            ]),
      ));
}
