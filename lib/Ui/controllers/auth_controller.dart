import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/Data/Models/user_model.dart';

class AuthController {
  static const String _userDataKey = 'user-data';
  static const String _tokenDataKey = 'token';

  static UserModel? userModel;
  static String? accessToken;
  static Future<void> saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    await sharedPreferences.setString(_tokenDataKey, token);

    userModel = model;
    accessToken = token;
  }

  static Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userModel = UserModel.fromJson(jsonDecode(sharedPreferences.getString(_userDataKey)!));
    accessToken=  sharedPreferences.getString(_tokenDataKey);
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenDataKey);
    if (token != null) {
      await getUserData();
      return true;
    } else {
      return false;
    }
  }

  static Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
    userModel = null;
  }
}
