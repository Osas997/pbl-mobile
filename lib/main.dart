import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:survey_bullyng/provider/auth_provider.dart';
import 'package:survey_bullyng/provider/is_login.dart';
import 'package:survey_bullyng/provider/murid_provider.dart';
import 'package:survey_bullyng/provider/pertanyaan_provider.dart';
import 'package:survey_bullyng/provider/survey_provider.dart';
import 'package:survey_bullyng/screens/isi_biodata.dart';
import 'package:survey_bullyng/screens/isi_survey.dart';
import 'package:survey_bullyng/screens/laporan_hasil.dart';
import 'package:survey_bullyng/screens/login_page.dart';
import 'package:survey_bullyng/screens/murid_home.dart';
import 'package:survey_bullyng/screens/laporan_korban.dart';
import 'package:survey_bullyng/screens/onboarding.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<MuridProvider>(
            create: (context) => MuridProvider()),
        ChangeNotifierProvider<PertanyaanProvider>(
            create: (context) => PertanyaanProvider()),
        ChangeNotifierProvider<SurveyProvider>(
            create: (context) => SurveyProvider()),
        ChangeNotifierProvider<IsLogin>(create: (context) => IsLogin()),
      ],
      child: const MyApp(),
    ),
  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance..indicatorType = EasyLoadingIndicatorType.dualRing;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<IsLogin>(context, listen: false).cekLogin();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white12,
      ),
      // initialRoute: MuridHome.routeName,
      home: Consumer<IsLogin>(builder: (context, login, _) => login.page),
      builder: EasyLoading.init(),
      routes: {
        BiodataPage.routeName: (context) => BiodataPage(),
        LoginPage.routeName: (context) => LoginPage(),
        MuridHome.routeName: (context) => MuridHome(),
        LaporanHasil.routeName: (context) => LaporanHasil(),
        SurveyPage.routeName: (context) => SurveyPage(),
        LaporanKorban.routeName: (context) => LaporanKorban(),
        OnBoardingPage.routeName: (context) => OnBoardingPage()
      },
    );
  }
}
