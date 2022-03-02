import 'package:dailytasksssss/LogIn_RegisterScreen/LogedIn.dart';
import 'package:dailytasksssss/LogIn_RegisterScreen/Login.dart';
import 'package:dailytasksssss/LogIn_RegisterScreen/SingUp.dart';
import 'package:dailytasksssss/LogIn_RegisterScreen/start.dart';
import 'package:dailytasksssss/pageProf/index.dart';
import 'package:dailytasksssss/pageProf/page_pro.dart';
import 'package:dailytasksssss/screens/home/home.dart';
import 'package:flutter/material.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Task App',
        initialRoute: '/HomePage',
        routes: {
          "/": (BuildContext context) => Start(),
          "/Login": (BuildContext context) => Login(),
          "/SignUp": (BuildContext context) => SignUp(),
          "/LogedIN": (BuildContext context) => LogedIn(),
          "/HomePage": (BuildContext context) => HomePage(),
          "/profilePage": (BuildContext context) => ProfilePage(),
          "/Indexindex": (BuildContext context) => Indexindex(),
        });
  }
}
