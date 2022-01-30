import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseDao {
  static final DatabaseDao _instance = DatabaseDao._internal();
  DatabaseDao._internal();
  factory DatabaseDao() {
    return _instance;
  }

  final String _dbPath = "temtem.db";
  final DatabaseFactory _dbFactory = databaseFactoryIo;
  late Database db;

  init() async {
    db = await _dbFactory.openDatabase(_dbPath);
  }
}
