import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:survey_bullyng/helpers/api_url.dart';
import 'package:survey_bullyng/helpers/user_info.dart';
import 'package:survey_bullyng/models/pertanyaan.dart';
import 'package:survey_bullyng/provider/survey_provider.dart';

class PertanyaanProvider extends ChangeNotifier {
  List<Pertanyaan> _dataPertanyaan = [];

  List<Pertanyaan> get dataPertanyaan => _dataPertanyaan;

  PertanyaanProvider() {
    getPertanyaan();
  }

  Future<void> getPertanyaan() async {
    try {
      String apiUrl = ApiUrl.pertanyaan;
      var token = await UserInfo.getToken();

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey('data')) {
          final List<dynamic> data = responseData['data'];

          List<Pertanyaan> pertanyaan =
              data.map((e) => Pertanyaan.fromJson(e)).toList();

          _dataPertanyaan = pertanyaan;

          SurveyProvider.initializeSurvey(_dataPertanyaan.length);

          notifyListeners();
        } else {
          print('Key "data" tidak ditemukan dalam response JSON');
        }
      } else {
        print('Gagal memuat pertanyaan. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }
  }
}
