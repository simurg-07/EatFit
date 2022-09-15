import 'package:eatfit/malzemeSayfasi.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'YemeklerSayfa.dart';
import 'malzemeler.dart';

class Malzeme extends StatefulWidget {
  const Malzeme({Key? key}) : super(key: key);

  @override
  _MalzemeState createState() => _MalzemeState();
}

class _MalzemeState extends State<Malzeme> {
  var refKategoriler = FirebaseDatabase.instance.ref().child("malzemeler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Malzemeye Göre")),
        ),
        body: StreamBuilder<DatabaseEvent>(
          stream: refKategoriler.onValue,
          builder: (context, event) {
            if (event.hasData) {
              var malzemeListesi = <Malzemeler>[];

              var gelenDegerler = event.data!.snapshot.value as dynamic;

              if (gelenDegerler != null) {
                gelenDegerler.forEach((key, nesne) {
                  var gelenMalzemeler = Malzemeler.fromJson(key, nesne);
                  malzemeListesi.add(gelenMalzemeler);
                });
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                ),
                itemCount: malzemeListesi.length,
                itemBuilder: (context, indeks) {
                  var malzeme = malzemeListesi[indeks];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                malzemeSayfasi(malzeme: malzeme),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 85,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Image.network("${malzeme.malzeme_resim}"),
                                ),
                                Text(
                                  malzeme.malzeme_ad,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          },
        ));
  }
}
