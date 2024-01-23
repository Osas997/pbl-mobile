import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_bullyng/provider/murid_provider.dart';

class BiodataPage extends StatelessWidget {
  const BiodataPage({Key? key}) : super(key: key);

  static const routeName = '/isi-biodata';

  @override
  Widget build(BuildContext context) {
    final muridProvider = Provider.of<MuridProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xfff4efef),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: muridProvider.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/tut wuri.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        20), // Spacer untuk memberi jarak antara logo dan input form
                Text(
                  "Data Diri Siswa",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  "Masukkan data diri siswa dengan benar",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama harus diisi!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Murid',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      muridProvider.setNamaMurid(value);
                    },
                  ),
                ),
                SizedBox(
                    height: 10), // Spacer untuk memberi jarak antara input form
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'NISN harus diisi!';
                      }
                      // Check if NISN has exactly 10 characters
                      if (value.length != 10) {
                        return 'NISN harus terdiri dari 10 karakter!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'NISN',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      muridProvider.setNisn(value);
                    },
                  ),
                ),
                SizedBox(
                    height: 10), // Spacer untuk memberi jarak antara input form
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kelas harus diisi!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Kelas',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      muridProvider.setKelas(value);
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jenis Kelamin harus dipilih!';
                      }
                      return null;
                    },
                    onChanged: (String? value) {
                      if (value == "Perempuan") {
                        muridProvider
                            .setSelectedGender('P'); // Ensure value is not null
                      } else {
                        muridProvider
                            .setSelectedGender('L'); // Ensure value is not null
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Jenis Kelamin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    items: ['Laki-Laki', 'Perempuan']
                        .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
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
                      if (muridProvider.formKey.currentState!.validate()) {
                        muridProvider.signup(context);
                        muridProvider.resetForm();
                      }
                    },
                    child: Text('Isi Survey'),
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
        ),
      ),
    );
  }
}
