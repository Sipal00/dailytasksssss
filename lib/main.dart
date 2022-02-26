import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dailytasksssss/addTasks/provider/taskProvider.dart';
import 'package:dailytasksssss/appView.dart';
import 'package:dailytasksssss/pageProf/index.dart';
import 'package:dailytasksssss/screens/home/home.dart';
import 'package:dailytasksssss/themes.dart';
import 'package:dailytasksssss/userPreferences/user_pre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

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

    /// when use more than one provider, use multiprovider to wrap all others
    return MultiProvider(
      providers: [
        Provider(
            create: (_) => ThemeProvider(
                  initTheme: user.isDarkMode
                      ? MyThemes.darkTheme
                      : MyThemes.lightTheme,
                )),
        ChangeNotifierProvider(create: (_) => TasksProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: ThemeProvider.of(context),
        title: 'Task App',
        home: Indexindex(),
      ),
    );
  }
}



 /* Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TasksProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home: Indexindex(),
        ),
      );
  */