import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Yemekler.dart';

class tarifsayfasi extends StatefulWidget {
  Yemekler yemek;

  tarifsayfasi({required this.yemek});

  @override
  State<tarifsayfasi> createState() => _tarifsayfasiState();
}

class _tarifsayfasiState extends State<tarifsayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.yemek.yemek_ad)),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Kutu(
                yemekk: widget.yemek.yemek_ad,
                resimlinki: "${widget.yemek.yemek_resim}",
                aciklama: widget.yemek.yemek_malzeme,
                hazirlanisi: widget.yemek.yemek_tarif,
                kackisilik: widget.yemek.kac_kisilik,
                hazirlamasuresi: widget.yemek.hazirlama_suresi,
                pisirmesuresi: widget.yemek.pisirme_suresi,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Kutu extends StatelessWidget {
  final String? yemekk;
  final String? resimlinki;
  final String? aciklama;
  final String? hazirlanisi;
  final int? kackisilik;
  final int? hazirlamasuresi;
  final int? pisirmesuresi;

  Kutu({
    Key? key,
    required this.yemekk,
    required this.resimlinki,
    required this.aciklama,
    required this.hazirlanisi,
    required this.kackisilik,
    required this.hazirlamasuresi,
    required this.pisirmesuresi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          width: double.infinity,
          height: 320,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0),
              )
            ],
            image: DecorationImage(
                image: NetworkImage(resimlinki!), fit: BoxFit.cover),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        color: Colors.white60,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "${kackisilik!.toString()} kişilik",
            style: TextStyle(
                fontSize: 25, fontFamily: 'RobotoMono', color: Colors.blue),
          ),
          Text(
            "${hazirlamasuresi!.toString()} dakika",
            style: TextStyle(
                fontSize: 25, fontFamily: 'RobotoMono', color: Colors.blue),
          ),
          Text(
            "${pisirmesuresi!.toString()} dakika",
            style: TextStyle(
                fontSize: 25, fontFamily: 'RobotoMono', color: Colors.blue),
          )
        ]),
      ),
      Divider(
        height: 5,
        color: Colors.grey,
        thickness: 2,
      ),
      SizedBox(
        height: 1,
      ),
      Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 209, 193, 193),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child:
                    Align(alignment: Alignment.topCenter, child: Container()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Text(
                        "Malzemeler",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'RobotoMono',
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(aciklama!,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Hazırlanışı",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'RobotoMono',
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(hazirlanisi!,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 20))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
