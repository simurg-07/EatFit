import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: ListView(children: [
          Column(children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Kutu(
                    yemek: "Hamburger",
                    resimlinki:
                    "https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_960_720.jpg"),
                SizedBox(
                  width: 10,
                ),
                Kutu(
                    yemek: "Salata",
                    resimlinki:
                    "https://media.istockphoto.com/photos/healthy-buddha-bowl-lunch-with-protein-spinach-avocado-kale-broccoli-picture-id1293187204?s=612x612"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Kutu(
                  yemek: "Balık",
                  resimlinki:
                  "https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712665_960_720.jpg",
                ),
                SizedBox(
                  width: 10,
                ),
                Kutu(
                    yemek: "Pasta",
                    resimlinki:
                    "https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_960_720.jpg"),


              ],
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Kutu(
                    yemek: "Hamburger",
                    resimlinki:
                    "https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_960_720.jpg"),
                SizedBox(
                  width: 10,
                ),
                Kutu(
                    yemek: "Salata",
                    resimlinki:
                    "https://media.istockphoto.com/photos/healthy-buddha-bowl-lunch-with-protein-spinach-avocado-kale-broccoli-picture-id1293187204?s=612x612"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Kutu(
                    yemek: "Balık",
                    resimlinki:
                    "https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712665_960_720.jpg",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Kutu(
                      yemek: "Pasta",
                      resimlinki:
                      "https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_960_720.jpg"),
                ]),
          ]
          )
        ]
        )
    );
  }
}

class Kutu extends StatelessWidget {
  final String? yemek;
  final String? resimlinki;

  const Kutu({
    Key? key,
    required this.yemek,
    required this.resimlinki,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 190,
        height: 190,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(resimlinki!), fit: BoxFit.cover),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        width: 190,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.grey),
        ),
        child: Center(child: Text(yemek!)),
      )
    ]);
  }
}
