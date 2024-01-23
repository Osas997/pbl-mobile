import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:survey_bullyng/helpers/api_url.dart';
import 'package:survey_bullyng/helpers/user_info.dart';
import 'package:survey_bullyng/models/murid.dart';
import 'package:survey_bullyng/screens/isi_survey.dart';

class MuridProvider extends ChangeNotifier {
  late Murid _murid;

  Murid get murid => _murid;

  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  String _selectedGender = '';
  String _namaMurid = '';
  String _nisn = '';
  String _kelas = '';

  void setSelectedGender(String value) {
    _selectedGender = value;
  }

  void setNamaMurid(String value) {
    _namaMurid = value;
  }

  void setNisn(String value) {
    _nisn = value;
  }

  void setKelas(String value) {
    _kelas = value;
  }

  void signup(BuildContext context) async {
    var idSekolah = await UserInfo.getIdSekolah();

    _murid = Murid(
        nisn: _nisn,
        namaMurid: _namaMurid,
        kelas: _kelas,
        jenisKelamin: _selectedGender,
        idSekolah: idSekolah.toString());

    Navigator.of(context).pushNamed(SurveyPage.routeName);

    Flushbar(
      margin: EdgeInsets.all(8),
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(8),
      message: 'Berhasil Sign Up!',
      duration: Duration(seconds: 3),
      backgroundColor: Color(0xff16f81d),
    ).show(context);
  }

  void resetForm() {
    _formKey.currentState?.reset();
    notifyListeners();
  }
}
