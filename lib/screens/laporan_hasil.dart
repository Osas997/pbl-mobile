import 'package:flutter/material.dart';

class LaporanHasil extends StatefulWidget {
  const LaporanHasil({Key? key}) : super(key: key);
  static const routeName = '/laporan-hasil';
  @override
  State<LaporanHasil> createState() => _LaporanHasilState();
}

class _LaporanHasilState extends State<LaporanHasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Back'),
        //   backgroundColor: Colors.white,
        // ),
        body: ListView(children: [
      Container(
        color: Colors.blue,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(15.0), // Adjust the radius as needed
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika login di sini
                      },
                      child: Text('Pelaku'),
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.white,
                        textStyle: TextStyle(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    margin: EdgeInsets.only(top: 20, left: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika login di sini
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
                  'Hasil Inventory Potensi Menjadi Korban Bullying',
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
                            ': MUHAMMAD ELANG PRAKOSO',
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
                            ': 12345678910',
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
                            ': 5E',
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
                            'Jenis Kelamin',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            ': Laki-Laki',
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
                            ': SMPU AL-ANWARI',
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
                      '9',
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
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: 300,
                          child: Text(
                            'Muhammad Elang Prakoso memiliki kecenderungan menjadi korban bullying yang Rendah. Hal ini dapat disebabkan oleh beberapa faktor, seperti kepercayaan diri, kemampuan sosial, atau dukungan dari orang - orang terdekat',
                            style: TextStyle(
                              fontSize: 10,
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
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, bottom: 20),
                          width: 300,
                          child: Text(
                            'Karena Anda termasuk dalam kategori potens rendah, untuk lebih jelasnya silahkan temui dan konsultasi hal ini dengan konselor anda',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ), // ini Rekomendasi
            ],
          ),
        ),
      )
    ]));
  }
}
