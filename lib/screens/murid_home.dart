import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_bullyng/helpers/user_info.dart';
import 'package:survey_bullyng/provider/auth_provider.dart';
import 'package:survey_bullyng/screens/isi_biodata.dart';
import 'package:survey_bullyng/screens/laporan_hasil.dart';
import 'package:survey_bullyng/screens/login_page.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MuridHome extends StatelessWidget {
  static const routeName = '/home-murid';

  // const MuridHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: Consumer<AuthProvider>(
              builder: (context, auth, _) {
                return ElevatedButton(
                  onPressed: () async {
                    await auth.logout(context);

                    Navigator.of(context)
                        .pushReplacementNamed(LoginPage.routeName);

                    Flushbar(
                      margin: EdgeInsets.all(8),
                      flushbarStyle: FlushbarStyle.FLOATING,
                      borderRadius: BorderRadius.circular(8),
                      message: 'Logout successful!',
                      duration: Duration(seconds: 3),
                      backgroundColor: Color(0xff16f81d),
                    )..show(context);
                  },
                  child: Text('Logout', style: TextStyle(color: Colors.blue)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: UserInfo.getSurvey(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // EasyLoading.show(
            //   status: 'loading...',
            // );
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // EasyLoading.dismiss();
            return ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 25),
                      child: Material(
                        elevation: 2, // Tingkat bayangan
                        borderRadius: BorderRadius.circular(15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage('assets/images/homeb.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Bahaya Bullying',
                        textAlign: TextAlign.left, // Ubah TextAlign ke center
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Bullying bukan sekadar tindakan yang tidak menyenangkan, itu adalah ancaman serius yang menghancurkan kesehatan mental, emosional, dan fisik. Dari ejekan verbal hingga intimidasi online, dampaknya dapat terasa jauh dan luas. Dalam ketidakpastian dan rasa takut, korban sering kali merasa terisolasi, kehilangan kepercayaan diri, bahkan mengalami gangguan psikologis yang berkepanjangan.',
                        textAlign: TextAlign.left, // Ubah TextAlign ke center
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 25),
                      child: Material(
                        elevation: 2, // Tingkat bayangan
                        borderRadius: BorderRadius.circular(15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage('assets/images/homea.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Ayo Lawan Aksi Bullying',
                        textAlign: TextAlign.left, // Ubah TextAlign ke center
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Tidak ada yang diuntungkan dari aksi bullying. Setiap kata kasar, ejekan, atau tindakan intimidasi adalah hal yang tidak baik. "Ayo Lawan!" Kami percaya bahwa dengan bersatu, kita dapat memerangi aksi buruk ini. Mari bersama-sama melawan setiap bentuk aksi bullying, menciptakan lingkungan yang mendukung, dan membuktikan bahwa kebaikan selalu lebih kuat daripada kebencian. Ayo lawan, bersama kita mewujudkan dunia tanpa rasa takut dan teror!',
                        textAlign: TextAlign.left, // Ubah TextAlign ke center
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 25),
                      child: Material(
                        elevation: 2, // Tingkat bayangan
                        borderRadius: BorderRadius.circular(15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage('assets/images/smp.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        '“Saling hormat bukan hanya sebuah kebiasaan, tetapi pilihan sadar untuk menciptakan masyarakat yang adil dan penuh kasih. Saat kita menghargai perbedaan dan mendukung satu sama lain, kita membuka pintu untuk perdamaian sejati. Mari bersama-sama menjadikan rasa hormat sebagai tonggak utama dalam setiap interaksi kita, karena di dalamnya terletak kunci untuk menciptakan dunia yang indah bersama”',
                        textAlign: TextAlign.center, // Ubah TextAlign ke center
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      width: double.infinity,
                      color: Color(0xFFDFF4FF),
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 0),
                            child: Text(
                              'Perjalanan Melawan Bullying Dalam Video Pendek',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(top: 25),
                            child: Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: 'r8tCRia5-pc',
                                    flags: const YoutubePlayerFlags(
                                      mute: false,
                                      autoPlay: false,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.blueAccent,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(top: 20),
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  BiodataPage.routeName,
                                );
                              },
                              child: Text('Mulai Survey'),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          if (snapshot.hasData)
                            Container(
                              width: 300,
                              margin: EdgeInsets.only(top: 20),
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    LaporanHasil.routeName,
                                  );
                                },
                                child: Text('Lihat Hasil Survey'),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
