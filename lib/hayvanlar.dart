class Hayvan {
  String kullanici_ad;
  String kullanici_cinsi;
  String kullanici_yas;

  Hayvan(this.kullanici_ad, this.kullanici_cinsi, this.kullanici_yas);

  factory Hayvan.fromJson(Map<dynamic,dynamic> json){
    return Hayvan(json["kullanici_ad"] as String, json["kullanici_cinsi"] as String, json["kullanici_yas"] as String);
  }
}