// ignore_for_file: unnecessary_string_escapes

import 'dart:convert';

import 'package:dailytasksssss/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        ' https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png  ',
    name: 'Sipal Salam',
    email: 'sipalsalam@gmail.com',
    about: ";;;;;;;;;;;;;;;;;;;;;",
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
