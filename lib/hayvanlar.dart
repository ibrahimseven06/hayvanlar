class Hayvan {
  String hayvan_ad;
  String hayvan_cinsi;
  String hayvan_tur;

  Hayvan(this.hayvan_ad, this.hayvan_tur, this.hayvan_cinsi);

  factory Hayvan.fromJson(Map<dynamic,dynamic> json){
    return Hayvan(json["hayvan_ad"] as String, json["hayvan_tur"] as String, json["hayvan_cinsi"] as String);
  }
}