
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dailytasksssss/appView.dart';
import 'package:dailytasksssss/themes.dart';
import 'package:dailytasksssss/userPreferences/user_pre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          //theme: ThemeProvider.of(context),
          title: 'Task App',
          home: AppView(),
        ),
      ),
    );
  }
}
