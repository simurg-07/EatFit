import 'dart:math';
import 'package:eatfit/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'GirisSayfasi.dart';

class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({Key? key}) : super(key: key);

  @override
  State<KayitSayfasi> createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  final TextEditingController _usernamecontrol = TextEditingController();
  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _passwordcontrol = TextEditingController();
  final TextEditingController _passwordconfirmcontrol = TextEditingController();

  AuthServices _authServices = AuthServices();

  final _formKey = GlobalKey<FormState>();
  late int RastgeleSayi;
  late String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
          children: <Widget>[
            FlutterLogo(
              size: 90,
            ),
            SizedBox(
              height: 80,
            ),
            TextFormField(
              controller: _usernamecontrol,
              autocorrect: true,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Kullanıcı Adı Giriniz",
                prefixIcon: Icon(Icons.account_circle),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen Kullanıcı Adı Giriniz';
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _emailcontrol,
              autocorrect: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email Adresinizi Girin:",
                prefixIcon: Icon(Icons.mail),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen Mail Giriniz';
                } else if (!value.contains("@")) {
                  return "Girilen Değer Mail Formatında olmalıdır";
                } else {
                  email = value;
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _passwordcontrol,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Şifrenizi Girin:",
                prefixIcon: Icon(Icons.lock),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen Şifre Giriniz';
                } else if (value.trim().length < 6) {
                  return "Şifre 6 Karakterden Az Olamaz";
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _passwordconfirmcontrol,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Şifreyi Tekrar Giriniz:",
                prefixIcon: Icon(Icons.lock),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Lütfen Şifre Giriniz';
                } else if (value.trim().length < 6) {
                  return "Şifre 6 Karakterden Az Olamaz";
                } else if (_passwordcontrol.text !=
                    _passwordconfirmcontrol.text) {
                  return 'Şifreler Uyuşmuyor';
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authServices
                            .createPerson(_usernamecontrol.text,
                                _emailcontrol.text, _passwordcontrol.text)
                            .then((value) {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GirisSayfasi()));
                        });
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                      "Kayıt Ol",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.blue.shade400),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
