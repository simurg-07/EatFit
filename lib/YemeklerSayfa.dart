import 'package:eatfit/TarifSayfasi.dart';
import 'package:eatfit/Yemekler.dart';
import 'package:eatfit/Kategoriler.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class YemeklerSayfa extends StatefulWidget {
  Kategoriler kategori;

  YemeklerSayfa({required this.kategori});

  @override
  _YemeklerSayfaState createState() => _YemeklerSayfaState();
}

class _YemeklerSayfaState extends State<YemeklerSayfa> {
  var refYemekler = FirebaseDatabase.instance.ref().child("filmler");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Center(child: Text("Yemekler: ${widget.kategori.kategori_ad}")),
        ),
        body: StreamBuilder<DatabaseEvent>(
          stream: refYemekler
              .orderByChild("kategori_ad")
              .equalTo(widget.kategori.kategori_ad)
              .onValue, // firebase de kategori sorgusu yapar
          builder: (context, event) {
            if (event.hasData) {
              var yemekListesi = <Yemekler>[];

              var gelenDegerler = event.data!.snapshot.value as dynamic;

              if (gelenDegerler != null) {
                gelenDegerler.forEach((key, nesne) {
                  var gelenYemek = Yemekler.fromJson(key, nesne);
                  yemekListesi.add(gelenYemek);
                });
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3.5,
                ),
                itemCount: yemekListesi.length,
                itemBuilder: (context, indeks) {
                  var yemek = yemekListesi[indeks];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tarifsayfasi(
                                    yemek: yemek,
                                  )));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network("${yemek.yemek_resim}"),
                          ),
                          Text(
                            yemek.yemek_ad,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
