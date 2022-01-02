import 'package:chaleno/chaleno.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:temtem_wiki/domain/model/temtem.dart';

class ScrappingService {
  static Future<List<String>> getTemtemListNames() async {
    List<String> names = [];
    var parser = await Chaleno()
        .load("https://temtem.fandom.com/wiki/Temtem_(creatures)");
    List<Result>? result =
        parser?.getElementsByClassName("temtemPortrait background");
    if (result != null) {
      for (int i = 0; i < result.length; i++) {
        if ((result[i].title ?? "").isNotEmpty) {
          names.add(result[i].title!);
        }
        //debugPrint("${result[i].title}");
      }
    }
    return names;
  }

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
    data["number"] = row.children[child++].text.trim();
    data["name"] = row.children[child].children[1].attributes["title"];
    String imagePath = row.children[child].children[0].children[0].children[0]
            .attributes["data-src"] ??
        "";
    String imageName = row.children[child++].children[0].children[0].children[0]
            .attributes["alt"] ??
        "";
    data["iconImage"] = imagePath + imageName;
    data["typeImages"] = [
      (row.children[child].children[0].children[0].attributes["data-src"] ??
              "") +
          (row.children[child].children[0].children[0]
                  .attributes["data-image-name"] ??
              "")
    ];

    data["types"] = [
      row.children[child++].children[1].text,
    ];
    if (hasDoubleType) {
      data["typeImages"].add(
          (row.children[child].children[0].children[0].attributes["data-src"] ??
                  "") +
              (row.children[child].children[0].children[0]
                      .attributes["data-image-name"] ??
                  ""));
      data["types"].add(row.children[child].children[1].text);
      child++;
    }
    data["hp"] = int.parse(row.children[child++].text.trim());
    data["sta"] = int.parse(row.children[child++].text.trim());
    data["spd"] = int.parse(row.children[child++].text.trim());
    data["atk"] = int.parse(row.children[child++].text.trim());
    data["def"] = int.parse(row.children[child++].text.trim());
    data["spatk"] = int.parse(row.children[child++].text.trim());
    data["spdef"] = int.parse(row.children[child++].text.trim());
    data["total"] = int.parse(row.children[child++].text.trim());

    //debugPrint("$data");
    return Temtem.fromMap(data);
  }
}
