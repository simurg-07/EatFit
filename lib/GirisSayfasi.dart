import 'package:eatfit/Kategoriler.dart';
import 'package:eatfit/KayitSayfasi.dart';
import 'package:eatfit/anasayfa.dart';
import 'package:eatfit/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eatfit/main.dart';
import 'package:eatfit/services/auth.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  final TextEditingController _emailcontrol = TextEditingController();
  final TextEditingController _passwordcontrol = TextEditingController();

  AuthServices _authServices = AuthServices();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://eatfit.net/media/logo.png"),
                ),
              ),
            ),
            SizedBox(
              height: 80,
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
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KayitSayfasi()));
                    },
                    child: Text(
                      "Hesap Oluştur",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.blue.shade400),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _authServices
                            .signIn(_emailcontrol.text, _passwordcontrol.text)
                            .then((value) {
                          return Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        });

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                      "Giriş Yap",
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

/*_authServices
    .signIn(_emailcontrol.text, _passwordcontrol.text)
.then((value) {
return Navigator.push(
context,
MaterialPageRoute(
builder: (context) => MyHomePage()));
});*/

final snackBar = SnackBar(
  content: const Text('Giriş Yapılıyor'),
  duration: Duration(seconds: 4),
);
//ScaffoldMessenger.of(context).showSnackBar(snackBar);
