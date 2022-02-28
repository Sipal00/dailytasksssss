import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dailytasksssss/model/user_model.dart';
import 'package:dailytasksssss/pageProf/edit_prof.dart';
import 'package:dailytasksssss/userPreferences/user_pre.dart';
import 'package:dailytasksssss/widget/appbar_widget.dart';
import 'package:dailytasksssss/widget/button_widget.dart';
import 'package:dailytasksssss/widget/number_widget.dart';
import 'package:dailytasksssss/widget/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              Center(child: buildUpgradeButton()),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Edit your profile',
        onClicked: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
          setState(() {});
        },
      );
}