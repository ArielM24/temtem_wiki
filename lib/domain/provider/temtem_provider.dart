import 'package:flutter/material.dart';
import 'package:temtem_wiki/domain/database/temtem_dao.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';

class TemtemProvider with ChangeNotifier {
  static final TemtemProvider _instance = TemtemProvider._internal();

  TemtemProvider._internal();
  factory TemtemProvider() {
    return _instance;
  }

  List<Temtem> _temtemList = [];

  List<Temtem> get temtemList => _temtemList;

  set temtemList(List<Temtem> v) {
    _temtemList = v;
    notifyListeners();
  }

  updateInfo(Temtem temtem) {
    int index = temtemList.indexWhere((element) => element.name == temtem.name);
    if (index > -1) {
      temtemList[index] = temtem;
      notifyListeners();
      TemtemDao.upsert(temtemList[index]);
    }
  }

  Temtem _temtem = Temtem();
  Temtem get temtem => _temtem;
  set temtem(Temtem v) {
    _temtem = v;
    notifyListeners();
  }

  updateDb() async {
    for (int i = 0; i < _temtemList.length; i++) {
      debugPrint("updating $i ${_temtemList[i].name}");
      await TemtemDao.upsert(_temtemList[i]);
    }
  }
}
