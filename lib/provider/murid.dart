import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:survey_bullyng/screens/isi_survey.dart';

class MuridProvider extends ChangeNotifier {
  Map<String, dynamic> _murid = {};

  Map<String, dynamic> get murid => _murid;

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  String _selectedGender = '';
  String _namaMurid = '';
  String _nisn = '';
  String _kelas = '';

  String get selectedGender => _selectedGender;
  String get namaMurid => _namaMurid;
  String get nisn => _nisn;
  String get kelas => _kelas;

  // Fungsi untuk mengubah pilihan jenis kelamin
  void setSelectedGender(String value) {
    _selectedGender = value;
    notifyListeners();
  }

  void setNamaMurid(String value) {
    _namaMurid = value;
    notifyListeners();
  }

  void setNisn(String value) {
    _nisn = value;
    notifyListeners();
  }

  void setKelas(String value) {
    _kelas = value;
    notifyListeners();
  }

  Future<void> signup(BuildContext context) async {
    final url = Uri.parse(
        'http://localhost:8000/api/signup'); // Sesuaikan URL dengan endpoint Anda

    try {
      final response = await http.post(
        url,
        body: {
          'nisn': _nisn,
          'nama_murid': _namaMurid,
          'kelas': _kelas,
          'jenis_kelamin': _selectedGender,
        },
        headers: {
          "Authorization":
              "Bearer 64|we21VLDXyu5gfIDcJtnEtu2xbJYNXdbYjT9NehOwd0082b9d",
        },
      );

      if (response.statusCode == 200) {
        // Berhasil mendaftar, lakukan sesuatu
        final Map<String, dynamic> responseData = json.decode(response.body);

        _murid = responseData;
        notifyListeners();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Berhasil Sign Up'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.of(context).pushReplacementNamed(SurveyPage.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal Sign Up'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ada Yang Salah'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
