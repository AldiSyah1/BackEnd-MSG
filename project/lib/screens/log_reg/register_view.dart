import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../models/userModel.dart';
import '../../providers/UsersProviders.dart';
import 'login_view.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "/registerPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _inputUsername = TextEditingController();
  final TextEditingController _inputEmail = TextEditingController();
  final TextEditingController _inputPassword = TextEditingController();
  final TextEditingController _inputRepeatPassword = TextEditingController();

  void showSnackbar(BuildContext context, pesan, Color color) {
    final snackBar = SnackBar(
      content: Text('${pesan}'),
      duration: Duration(seconds: 3),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool _passwordVisible = true;
  bool _passwordRepeatVisible = true;

  void initState() {
    _passwordVisible = true;
    _passwordRepeatVisible = true;
  }

  Future<void> registerUser() async {
    final prov = Provider.of<UsersProvider>(context, listen: false);
    var uuid = const Uuid();

    final email = _inputEmail.text;
    final username = _inputUsername.text;
    final password = _inputPassword.text;
    final repeatPassword = _inputRepeatPassword.text;

    if (username.isEmpty || password.isEmpty || repeatPassword.isEmpty) {
      showSnackbar(context, 'Tolong daftarkan akun anda dahulu !',
          ColorPalette.textColor);
      return;
    }

    if (password != repeatPassword) {
      showSnackbar(
          context, 'Konfirmasi Password tidak sesuai!', ColorPalette.textColor);
      return;
    }

    final userModel = UserModel(
      id: uuid.v1(),
      username: username,
      email: email,
      password: password,
    );

    try {
      // Perform the registration operation (replace with your actual logic)
      prov.register(userModel);

      // Registration successful
      showSnackbar(
          context, 'Registrasi Akun Berhasil!', ColorPalette.primaryDarkColor);

      // Navigate to the login page
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (error) {
      // Handle any registration errors here
      print('Registration Error: $error');
      showSnackbar(
          context, 'Gagal melakukan registrasi.', ColorPalette.textColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorPalette.primaryColor,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/Image Logo App.png",
                        width: 123.0,
                        height: 165.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                      ),
                      const Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),
                      const Text(
                        "Belum punya akun? silahkan registrasi terlebih dahulu",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),
                      TextFormField(
                        controller: _inputEmail,
                        decoration: const InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(color: Color(0xFFECEFF1)),
                          ),
                          icon: Icon(Icons.alternate_email),
                          iconColor: Colors.white,
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.underlineTextField,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        autofocus: false,
                      ),
                      TextFormField(
                        controller: _inputUsername,
                        decoration: const InputDecoration(
                          label: Text(
                            'Username',
                            style: TextStyle(color: Color(0xFFECEFF1)),
                          ),
                          icon: Icon(Icons.account_circle_outlined),
                          iconColor: Colors.white,
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.underlineTextField,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        autofocus: false,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),
                      TextFormField(
                        controller: _inputPassword,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          label: const Text(
                            'Password',
                            style: TextStyle(color: Color(0xFFECEFF1)),
                          ),
                          suffixIcon: InkWell(
                              onTap: () => setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  }),
                              child: Icon(_passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined)),
                          suffixIconColor: Colors.white,
                          icon: const Icon(Icons.password),
                          iconColor: Colors.white,
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.underlineTextField,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        autofocus: false,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                      ),
                      TextFormField(
                        controller: _inputRepeatPassword,
                        obscureText: _passwordRepeatVisible,
                        decoration: InputDecoration(
                          label: const Text(
                            'Confirm Password',
                            style: TextStyle(color: Color(0xFFECEFF1)),
                          ),
                          suffixIcon: InkWell(
                              onTap: () => setState(() {
                                    _passwordRepeatVisible =
                                        !_passwordRepeatVisible;
                                  }),
                              child: Icon(_passwordRepeatVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined)),
                          suffixIconColor: Colors.white,
                          icon: const Icon(Icons.password),
                          iconColor: Colors.white,
                          border: const UnderlineInputBorder(),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: ColorPalette.underlineTextField,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 3.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        autofocus: false,
                      ),
                      Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 16.0),
                          ),
                          InkWell(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              width: double.infinity,
                              child: Text(
                                'Register',
                                style:
                                    TextStyle(color: ColorPalette.primaryColor),
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onTap: () {
                              registerUser(); // Call the registration method
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                          ),
                          Text(
                            'or',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16.0),
                          ),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              width: double.infinity,
                              child: Text(
                                'Login',
                                style:
                                    TextStyle(color: ColorPalette.primaryColor),
                                textAlign: TextAlign.center,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "/");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
