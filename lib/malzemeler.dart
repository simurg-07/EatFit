class Malzemeler {
  String malzeme_id;
  String malzeme_ad;
  String malzeme_resim;

  Malzemeler(
    this.malzeme_id,
    this.malzeme_ad,
    this.malzeme_resim,
  );

  factory Malzemeler.fromJson(String key, Map<dynamic, dynamic> json) {
    return Malzemeler(
      key,
      json["malzeme_ad"] as String,
      json["malzeme_resim"] as String,
    );
  }
}
