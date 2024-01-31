import 'dart:convert';
import 'doa.dart';

List<DoaList> doaFromJson(String str) =>
    List<DoaList>.from(json.decode(str).map((x) => DoaList.fromJson(x)));

String doaToJson(List<DoaList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoaList {
  DoaList({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,
    this.listdoa});

    int id;
    String doa;
    String ayat;
    String latin;
    String artinya;
    int jumlahdoa = 1;
    List<Doa>? listdoa;

    factory DoaList.fromJson(Map<String, dynamic> json) => DoaList(
      id: json["id"], 
      doa: json["doa"], 
      ayat: json["ayat"], 
      artinya: json["artinya"], 
      latin: json["latin"],
      listdoa: json.containsKey('ayat')
          ? List<Doa>.from(json["ayat"]!.map((x) => Doa.fromJson(x)))
          : null);

    Map<String, dynamic> toJson() => {
      "id": id,
      "doa": doa,
      "ayat": ayat,
      "latin": latin,
      "artinya": artinya,
      "listdoa":
            listdoa != null ? List<dynamic>.from(listdoa!.map((e) => e.toJson())) : []
    };
}