import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:survey_bullyng/helpers/api_url.dart';
import 'package:survey_bullyng/helpers/user_info.dart';
import 'package:survey_bullyng/screens/murid_home.dart';

class AuthProvider with ChangeNotifier {
  String _username = '';
  String _password = '';

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  String get username => _username;
  String get password => _password;

  void setUsername(String username) {
    _username = username;
  }

  void setPassword(String password) {
    _password = password;
  }

  Future<void> login(BuildContext context) async {
    final Map<String, dynamic> data = {
      'username': _username,
      'password': _password,
    };

    try {
      String apiUrl = ApiUrl.login;

      final response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        var token = responseData['data']['token'];
        var id = responseData['data']['sekolah']['id'];

        UserInfo.setToken(token);
        UserInfo.setIdSekolah(id.toString());

        Navigator.of(context).pushReplacementNamed(MuridHome.routeName);

        Flushbar(
          margin: EdgeInsets.all(8),
          flushbarStyle: FlushbarStyle.FLOATING,
          borderRadius: BorderRadius.circular(8),
          message: 'Login successful!',
          duration: Duration(seconds: 3),
          backgroundColor: Color(0xff16f81d),
        )..show(context);
      } else {
        Flushbar(
          margin: EdgeInsets.all(8),
          flushbarPosition: FlushbarPosition.TOP,
          borderRadius: BorderRadius.circular(8),
          message: responseData['error']['message'],
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        )..show(context);
      }
    } catch (error) {
      Flushbar(
        margin: EdgeInsets.all(8),
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(8),
        message: "Ada Yang Salah ${error.toString()}",
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      )..show(context);
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      String apiUrl = ApiUrl.logout;

      var token = await UserInfo.getToken();

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        UserInfo.removeToken();
        UserInfo.removeSurvey();
        UserInfo.removeIdSekolah();
      } else {
        // Handle logout error
        Flushbar(
          margin: EdgeInsets.all(8),
          flushbarPosition: FlushbarPosition.TOP,
          borderRadius: BorderRadius.circular(8),
          message: "Gagal Logout",
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        )..show(context);
      }
    } catch (error) {
      // Handle logout error
      Flushbar(
        margin: EdgeInsets.all(8),
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(8),
        message: "Ada Yang Salah ${error.toString()}",
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      )..show(context);
    }
  }
}
