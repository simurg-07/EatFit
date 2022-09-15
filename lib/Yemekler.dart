class Yemekler {
  String yemek_id;
  String yemek_ad;
  String yemek_tarif;
  String yemek_resim;
  String kategori_ad;
  String yemek_malzeme;
  int kac_kisilik;
  int hazirlama_suresi;
  int pisirme_suresi;

  Yemekler(
    this.yemek_id,
    this.yemek_ad,
    this.yemek_tarif,
    this.yemek_resim,
    this.kategori_ad,
    this.yemek_malzeme,
    this.kac_kisilik,
    this.hazirlama_suresi,
    this.pisirme_suresi,
  );

  factory Yemekler.fromJson(String key, Map<dynamic, dynamic> json) {
    return Yemekler(
      key,
      json["yemek_ad"] as String,
      json["yemek_tarif"] as String,
      json["yemek_resim"] as String,
      json["yemek_ad"] as String,
      json["yemek_malzeme"] as String,
      json["kac_kisilik"] as int,
      json["hazirlama_suresi"] as int,
      json["pisirme_suresi"] as int,
    );
  }
}
