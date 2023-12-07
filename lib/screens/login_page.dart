import 'package:flutter/material.dart';
import 'package:survey_bullyng/provider/auth_provider.dart';
import 'package:survey_bullyng/screens/murid_home.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Color(0xfff4efef),
      body: Center(
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
              height: 20,
            ),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              "Please enter your details",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: authProvider
                  .formKey, // Access the form key from the AuthProvider
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        authProvider.setUsername(value);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username Tidak Boleh Kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        authProvider.setPassword(value);
                      },
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password Tidak Boleh Kosong';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  if (authProvider.formKey.currentState!.validate()) {
                    await authProvider.login(context);
                    if (authProvider.isLoggedIn) {
                      Navigator.of(context)
                          .pushReplacementNamed(MuridHome.routeName);
                    }
                  }
                },
                child: authProvider.isLoading
                    ? CircularProgressIndicator()
                    : Text('Login'),
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
