import 'package:flutter/material.dart';
import 'package:survey_bullyng/helpers/user_info.dart';
import 'package:survey_bullyng/screens/murid_home.dart';
import 'package:survey_bullyng/screens/onboarding.dart';

class IsLogin extends ChangeNotifier {
  Widget page = CircularProgressIndicator();

  void cekLogin() async {
    var token = await UserInfo.getToken();
    if (token != null) {
      page = MuridHome();
    } else {
      page = const OnBoardingPage();
    }
    notifyListeners();
  }
}
