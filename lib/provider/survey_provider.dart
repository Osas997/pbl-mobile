import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:survey_bullyng/helpers/api_url.dart';
import 'package:survey_bullyng/helpers/user_info.dart';
import 'package:survey_bullyng/models/murid.dart';
import 'package:survey_bullyng/screens/murid_home.dart';

class SurveyProvider extends ChangeNotifier {
  static List<Map<String, dynamic>> _survey = [];

  List<Map<String, dynamic>> get survey => _survey;

  Map<String, dynamic> _hasilSurvey = {};

  Map<String, dynamic> get hasilSurvey => _hasilSurvey;

  static void initializeSurvey(int panjang) {
    _survey = List.generate(panjang, (index) => {});
  }

  void isiSurvey(
      {required String idPertanyaan,
      required int skor,
      required String tipePertanyaan,
      required int index}) {
    _survey[index] = {
      "id_pertanyaan": idPertanyaan,
      "skor": skor,
      "tipe_pertanyaan": tipePertanyaan
    };

    notifyListeners();
  }

  Future<void> submitSurvey(BuildContext context, Murid murid) async {
    String apiUrl = ApiUrl.survey;

    var token = await UserInfo.getToken();

    final url = Uri.parse(apiUrl);

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'nisn': murid.nisn,
          'nama_murid': murid.namaMurid,
          'kelas': murid.kelas,
          'jenis_kelamin': murid.jenisKelamin,
          'id_sekolah': murid.idSekolah,
          'survey': _survey
        }),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type":
              "application/json", // Add this line to specify content type
        },
      );

      if (response.statusCode == 200) {
        // Berhasil mendaftar, lakukan sesuatu
        final Map<String, dynamic> responseData = json.decode(response.body);

        _hasilSurvey = responseData['data'];

        UserInfo.setSurvey(_hasilSurvey);

        Navigator.of(context).pushReplacementNamed(MuridHome.routeName);

        Flushbar(
          margin: EdgeInsets.all(8),
          flushbarStyle: FlushbarStyle.FLOATING,
          borderRadius: BorderRadius.circular(8),
          message: 'Berhasil Mengisi Survey',
          duration: Duration(seconds: 3),
          backgroundColor: Color(0xff16f81d),
        ).show(context);
      } else {
        Flushbar(
          margin: EdgeInsets.all(8),
          flushbarStyle: FlushbarStyle.FLOATING,
          borderRadius: BorderRadius.circular(8),
          message: 'Gagal Mengisi Survey Status Code: ${response.statusCode}',
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ).show(context);
      }
    } catch (e) {
      Flushbar(
        margin: EdgeInsets.all(8),
        flushbarStyle: FlushbarStyle.FLOATING,
        borderRadius: BorderRadius.circular(8),
        message: 'Ada yang salah',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ).show(context);
    }
  }
}
