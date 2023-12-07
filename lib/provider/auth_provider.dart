import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String _username = '';
  String _password = '';
  String _token = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String get username => _username;
  String get password => _password;
  String get token => _token;

  void setUsername(String username) {
    _username = username;
  }

  void setPassword(String password) {
    _password = password;
  }

  Future<void> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final Map<String, dynamic> data = {
      'username': _username,
      'password': _password,
    };

    try {
      String urlLocalhost = 'http://localhost:8000/api/login';
      String urlUsb = 'http://192.168.1.14:8000/api/login';

      final response = await http.post(
        Uri.parse(urlUsb),
        body: data,
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        _token = responseData['token'];
        _isLoggedIn = true;
        notifyListeners();

        // Tampilkan Snackbar notifikasi berhasil login
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(responseData['error']['message']),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Ada Yang Salah"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
