import 'package:temtem_wiki/domain/enums/temtem_types.dart';

class Temtem {
  String number;
  String name;
  List<TemtemType> types;
  List<String> typeImages;
  String iconImage;
  int hp;
  int sta;
  int spd;
  int atk;
  int def;
  int spatk;
  int spdef;
  int total;

  Temtem(
      {this.number = "",
      this.name = "",
      this.typeImages = const [],
      this.iconImage = "",
      this.types = const [],
      this.hp = 0,
      this.sta = 0,
      this.spd = 0,
      this.atk = 0,
      this.def = 0,
      this.spatk = 0,
      this.spdef = 0,
      this.total = 0});

  static Temtem fromMap(Map<String, dynamic> map) {
    return Temtem(
        number: map["number"],
        name: map["name"],
        iconImage: map["iconImage"],
        typeImages: map["typeImages"],
        types: fromStringList(map["types"]),
        hp: map["hp"],
        sta: map["sta"],
        spd: map["spd"],
        atk: map["atk"],
        def: map["def"],
        spatk: map["spatk"],
        spdef: map["spdef"],
        total: map["total"]);
  }
}
