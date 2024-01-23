import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<void> setIdSekolah(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
  }

  static Future<void> setSurvey(Map<String, dynamic> surveyData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('survey_data', json.encode(surveyData));
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<String?> getIdSekolah() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('id');
  }

  static Future<Map<String, dynamic>?> getSurvey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? surveyData = prefs.getString('survey_data');

    if (surveyData != null) {
      Map<String, dynamic> surveyMap = json.decode(surveyData);
      return surveyMap;
    } else {
      return null;
    }
  }

  static Future<void> removeSurvey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('survey_data');
  }

  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  static Future<void> removeIdSekolah() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
  }
}
