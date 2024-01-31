class Doa {
  Doa({
    required this.id,
    required this.namadoa,
    required this.arab,
    required this.arti,
    required this.latindoa,
  });

  int id;
  String namadoa;
  String arab;
  String arti;
  String latindoa;

  factory Doa.fromJson(Map<String, dynamic> json) => Doa(
        id: json["id"],
        namadoa: json["namadoa"],
        arab: json["arab"],
        arti: json["arti"],
        latindoa: json["latindoa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namadoa": namadoa,
        "arab": arab,
        "arti": arti,
        "latindoa": latindoa,
      };
}