class Temtem {
  int number;
  String name;
  List<String> types;
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
  String image;
  String lumaImage;

  Temtem(
      {this.number = -1,
      this.name = "",
      this.image = "",
      this.lumaImage = "",
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
        typeImages: map["typeImages"].cast<String>(),
        types: map["types"].cast<String>(),
        image: map["image"] ?? "",
        lumaImage: map["lumaImage"] ?? "",
        hp: map["hp"],
        sta: map["sta"],
        spd: map["spd"],
        atk: map["atk"],
        def: map["def"],
        spatk: map["spatk"],
        spdef: map["spdef"],
        total: map["total"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "number": number,
      "name": name,
      "iconImage": iconImage,
      "typeImages": typeImages,
      "types": types,
      "image": image,
      "lumaImage": lumaImage,
      "hp": hp,
      "sta": sta,
      "spd": spd,
      "atk": atk,
      "def": def,
      "spatk": spatk,
      "spdef": spdef,
      "total": total,
    };
  }
}
