import 'package:flutter/material.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({Key? key}) : super(key: key);
  static const routeName = '/isi-biodata';

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4efef),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   width: 80,
            //   height: 80,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/tut wuri.png'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            SizedBox(
                height:
                    20), // Spacer untuk memberi jarak antara logo dan input form
            Text("Data Diri Siswa",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                )),
            Text("Masukkan data diri siswa dengan benar",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                )),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nama Murid',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 10), // Spacer untuk memberi jarak antara input form
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'NISN',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 10), // Spacer untuk memberi jarak antara input form
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Jenis kelamin',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(
                height:
                    10), // Spacer untuk memberi jarak antara input form dan tombol login
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika login di sini
                },
                child: Text('isi survey'),
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
    );
  }
}
