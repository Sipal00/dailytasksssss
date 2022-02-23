// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';

import 'package:dailytasksssss/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath: '"C:\Users\sc217\Desktop\sipal5\weeee code\25.jpg"',
    name: 'Sipal Salam',
    email: 'sipalsalam225@gmail.com',
    about: "",
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
