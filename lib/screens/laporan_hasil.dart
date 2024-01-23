import 'package:flutter/material.dart';
import 'package:survey_bullyng/helpers/user_info.dart';
import 'package:survey_bullyng/screens/laporan_korban.dart';

class LaporanHasil extends StatelessWidget {
  const LaporanHasil({Key? key}) : super(key: key);

  static const routeName = '/laporan-hasil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          color: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(15.0), // Adjust the radius as needed
            ),
            child: FutureBuilder(
              future: UserInfo.getSurvey(),
              builder: (context, snapshot) {
                Map<String, dynamic> data = snapshot.data!;
                return Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 40,
                          margin: EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                LaporanKorban.routeName,
                              );
                            },
                            child: Text('Korban'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), //ini button
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        'Hasil Inventory Potensi Menjadi Pelaku Bullying',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ), // ini Judul
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  'Nama',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ": ${data['murid']['nama_murid']}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "arial",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  'NISN',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ": ${data['murid']['nisn']}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "arial",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  'Kelas',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ": ${data['murid']['kelas']}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "arial",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  "Jenis Kelamin",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  data['murid']['jenis_kelamin'] == "P"
                                      ? ': Perempuan'
                                      : ": Laki Laki",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "arial",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  'Sekolah',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ': ${data['murid']['sekolah']['nama_sekolah']}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "arial",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), // ini data diri
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            'Nilai Anda',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            data['skor_total_pelaku'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ), // ini Nilai anda
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Rentang Nilai :',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  'Skor 14 - 23',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ': Berpotensi Rendah',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "arial",
                                      color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  'Skor 24 - 34',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ': Berpotensi Sedang',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "arial",
                                      color: Colors.amber),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  'Skor 35 - 45',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ': Berpotensi Tinggi',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "arial",
                                      color: Colors.orange),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                width: 100,
                                child: Text(
                                  'Skor 46 - 56',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ': Berpotensi Sangat Tinggi',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "arial",
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), // ini Rentang Nilai
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Interpretasi :',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              if (data['skor_total_pelaku'] >= 35)
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: 300,
                                  child: Text(
                                    '${data["murid"]["nama_murid"]} memiliki kecenderungan menjadi pelaku bullying yang tinggi Dan anda berpotensi tinggi menjadi pelaku bullying. Anda cenderung untuk melakukan Tindakan-tindakan yang mengarah pada perilaku kekerasan sehingga membuat korban anda merasa tersakiti dan tersiksa',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                )
                              else if (data['skor_total_pelaku'] >= 24 &&
                                  data['skor_total_pelaku'] < 35)
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: 300,
                                  child: Text(
                                    '${data["murid"]["nama_murid"]} memiliki kecenderungan menjadi pelaku bullying yang sedang  Dan anda berpotensi sedang menjadi pelaku bullying. Sebagian Tindakan anda mencerminkan perilaku bullying yang dapat membuat korban anda merasa tersakiti',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                )
                              else
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: 300,
                                  child: Text(
                                    '${data["murid"]["nama_murid"]} memiliki kecenderungan menjadi pelaku bullying yang Rendah Dan anda berpotensi rendah menjadi pelaku bullying. Sebagian Tindakan anda mencerminkan perilaku bullying tetapi masih dalam taraf rendah',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                )
                            ],
                          )
                        ],
                      ),
                    ), // ini interpretasi
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Rekomendasi :',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 40),
                            child: Row(
                              children: [
                                if (data['skor_total_pelaku'] >= 35)
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    width: 300,
                                    child: Text(
                                      'Karena anda termasuk dalam kategori berpotensi Tinggi menjadi Pelaku bullying, sebaiknya anda segera temui konselor anda dan mengkonsultasikan hal ini kepada konselor',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  )
                                else if (data['skor_total_pelaku'] >= 24 &&
                                    data['skor_total_pelaku'] < 35)
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    width: 300,
                                    child: Text(
                                      'Karena anda termasuk dalam kategori berpotensi Sedang menjadi Pelaku bullying, sebaiknya anda segera temui konselor anda dan mengkonsultasikan hal ini kepada konselor',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  )
                                else
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    width: 300,
                                    child: Text(
                                      'Karena anda termasuk dalam kategori berpotensi rendah menjadi Pelaku bullying, sebaiknya anda segera temui konselor anda dan mengkonsultasikan hal ini kepada konselor',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Poppins",
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // ini Rekomendasi
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ]));
  }
}
