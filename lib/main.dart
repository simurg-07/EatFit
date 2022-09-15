import 'package:eatfit/GirisSayfasi.dart';
import 'package:eatfit/Kategori.dart';
import 'package:eatfit/TarifSayfasi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Kategoriler.dart';
import 'YemeklerSayfa.dart';
import 'anasayfa.dart';
import 'profil.dart';
import 'malzeme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final screens = [
    Malzeme(),
    Anasayfa(),
    MyHomePagee(),
  ];

  var refKategoriler = FirebaseDatabase.instance.ref().child("kategoriler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(98.0),
          child: Text(
            "EatFit",
            style: TextStyle(fontSize: 26),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: screens[currentIndex],
      drawer: Drawer(
          child: StreamBuilder<DatabaseEvent>(
        stream: refKategoriler.onValue,
        builder: (context, event) {
          if (event.hasData) {
            var kategoriListesi = <Kategoriler>[];

            var gelenDegerler = event.data!.snapshot.value as dynamic;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenKategori = Kategoriler.fromJson(key, nesne);
                kategoriListesi.add(gelenKategori);
              });
            }
            return ListView.builder(
              itemCount: kategoriListesi.length,
              itemBuilder: (context, indeks) {
                var kategori = kategoriListesi[indeks];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YemeklerSayfa(
                                  kategori: kategori,
                                )));
                  },
                  child: Card(
                      elevation: 45,
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text(kategori.kategori_ad)],
                        ),
                      )),
                );
              },
            );
          } else {
            return Center();
          }
        },
      )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Malzeme",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Tarifler")
          ]),
    );
  }
}
