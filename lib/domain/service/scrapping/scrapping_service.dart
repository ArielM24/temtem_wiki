import 'package:chaleno/chaleno.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/domain/service/image_service.dart';

class ScrappingService {
  static Future<List<Temtem>> getTemtemData() async {
    var parser = await Chaleno()
        .load("https://temtem.fandom.com/wiki/Temtem_(creatures)");
    List<Result>? temtemList = parser?.getElementsByClassName("temtem-list");
    List<Temtem> temtem = [];
    if ((temtemList ?? []).isNotEmpty) {
      temtem = _getTableTemtem(temtemList!.first.html!);
    }
    return temtem;
  }

  static List<Temtem> _getTableTemtem(String html) {
    Document document = parse(html);
    List<Temtem> temtem = [];
    Element tableBody = document.getElementsByTagName("tbody").first;
    List<Element> rows = tableBody.getElementsByTagName("tr");
    rows.removeWhere((r) => r.children.length < 11);
    debugPrint("rows: ${rows.length}");
    for (int i = 0; i < rows.length; i++) {
      Temtem t = _getTemtemData(rows[i]);
      if (t.name.isNotEmpty) {
        temtem.add(t);
      }
    }
    return temtem;
  }

  static Temtem _getTemtemData(Element row) {
    bool hasDoubleType = row.children.length == 12;
    Map<String, dynamic> data = {};
    int child = 0;
    data["number"] =
        int.parse(row.children[child++].text.trim().replaceAll("#", ""));
    data["name"] = row.children[child].children[1].attributes["title"];
    String imagePath = row.children[child++].children[0].children[0].children[0]
            .attributes["data-src"] ??
        "";
    data["iconImage"] = imagePath;
    data["typeImages"] = [
      (row.children[child].children[0].children[0].attributes["data-src"] ?? "")
    ];

    data["types"] = [
      row.children[child++].children[1].text,
    ];
    if (hasDoubleType) {
      data["typeImages"].add(
          (row.children[child].children[0].children[0].attributes["data-src"] ??
              ""));
      data["types"].add(row.children[child].children[1].text);
      child++;
    }
    data = _getStats(row, data, child);
    //debugPrint("$data");
    return Temtem.fromMap(data);
  }

  static Map<String, dynamic> _getStats(
      Element row, Map<String, dynamic> data, int child) {
    data["hp"] = int.parse(row.children[child++].text.trim());
    data["sta"] = int.parse(row.children[child++].text.trim());
    data["spd"] = int.parse(row.children[child++].text.trim());
    data["atk"] = int.parse(row.children[child++].text.trim());
    data["def"] = int.parse(row.children[child++].text.trim());
    data["spatk"] = int.parse(row.children[child++].text.trim());
    data["spdef"] = int.parse(row.children[child++].text.trim());
    data["total"] = int.parse(row.children[child++].text.trim());
    return data;
  }

  static Future<Temtem> _getImages(Document document, Temtem temtem) async {
    Element? lumaImage = document.getElementById("ttw-temtem-luma");
    String img =
        lumaImage?.children[0].children[0].children[0].attributes["data-src"] ??
            "";
    temtem.lumaImage = img;
    temtem.lumaBytes = await getImageBytes(temtem.lumaImage);
    Element? image = document.getElementById("ttw-temtem");
    img =
        image?.children[0].children[0].children[0].attributes["data-src"] ?? "";
    temtem.image = img;
    temtem.normalBytes = await getImageBytes(temtem.image);

    return temtem;
  }

  static Future<Temtem> completeTemtemInfo(Temtem temtem) async {
    Parser? parser =
        await Chaleno().load("https://temtem.fandom.com/wiki/" + temtem.name);
    Document document = parse(parser?.html);
    temtem = await _getImages(document, temtem);

    return temtem;
  }
}
