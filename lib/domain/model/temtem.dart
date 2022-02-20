import 'dart:io';
import 'dart:typed_data';

import 'package:temtem_wiki/domain/service/image_service.dart';

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
  String normalImageFile;
  String lumaImageFile;
  int maleRatio;
  int femaleRatio;

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
      this.total = 0,
      this.maleRatio = 0,
      this.femaleRatio = 0,
      this.normalImageFile = "",
      this.lumaImageFile = ""});

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
        total: map["total"],
        maleRatio: map["maleRatio"] ?? 0,
        femaleRatio: map["femaleRatio"] ?? 0,
        lumaImageFile: map["lumaImageFile"] ?? "",
        normalImageFile: map["normalImageFile"] ?? "");
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
      "maleRatio": maleRatio,
      "femaleRatio": femaleRatio,
      "normalImageFile": normalImageFile,
      "lumaImageFile": lumaImageFile,
    };
  }

  Future<void> createImagesDirectory() async {
    Directory imagesDirectory = Directory("images/temtem/");
    if (!imagesDirectory.existsSync()) {
      await imagesDirectory.create(recursive: true);
    }
  }

  Future<void> writeImagesBytes() async {
    await createImagesDirectory();
    if (lumaImage.isNotEmpty) {
      String? fileName = await writeImageBytes(
          url: lumaImage, fileName: "images/temtem/${name}_luma.png");
      if (fileName != null) {
        lumaImageFile = fileName;
      }
    }
    if (image.isNotEmpty) {
      String? fileName = await writeImageBytes(
          url: image, fileName: "images/temtem/$name.png");
      if (fileName != null) {
        normalImageFile = fileName;
      }
    }
  }
}
