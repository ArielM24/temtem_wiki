import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:temtem_wiki/domain/database/database_dao.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';

class TemtemDao {
  static final store = intMapStoreFactory.store("temtem");

  static init() {
    store.addOnChangesListener(DatabaseDao().db, (transaction, changes) {
      debugPrint("Database changes $transaction");
    });
  }

  static readAll() async {
    var records = await store.find(DatabaseDao().db);
    debugPrint("records ${records.length}");
  }

  static drop() async {
    debugPrint("droping database");
    await store.drop(DatabaseDao().db);
  }

  static Future<Temtem?> findByNumber(int number) async {
    var record = await store.findFirst(DatabaseDao().db,
        finder: Finder(filter: Filter.equals("number", number)));
    //debugPrint("records ${record.runtimeType} ${record?.value}");
    try {
      if (record?.value != null) {
        return Temtem.fromMap(record!.value);
      }
    } catch (ex) {
      debugPrint("$ex");
    }
  }

  static write(Temtem temtem) async {
    debugPrint("writing temtem");
    var key = await store.add(DatabaseDao().db, temtem.toMap());
    debugPrint("key ${key}");
    var record = await store.record(key).getSnapshot(DatabaseDao().db);
    //debugPrint("record ${record}");
  }
}
