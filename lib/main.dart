import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_bullyng/provider/auth_provider.dart';
import 'package:survey_bullyng/screens/isi_biodata.dart';
import 'package:survey_bullyng/screens/isi_survey.dart';
import 'package:survey_bullyng/screens/laporan_hasil.dart';
import 'package:survey_bullyng/screens/login_page.dart';
import 'package:survey_bullyng/screens/murid_home.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white12,
      ),
      // initialRoute: MuridHome.routeName,
      home: LoginPage(),
      routes: {
        BiodataPage.routeName: (context) => BiodataPage(),
        LoginPage.routeName: (context) => LoginPage(),
        MuridHome.routeName: (context) => MuridHome(),
        LaporanHasil.routeName: (context) => LaporanHasil(),
        SurveyPage.routeName: (context) => SurveyPage()
      },
    );
  }
}
