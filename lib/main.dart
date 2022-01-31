import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/database/database_dao.dart';
import 'package:temtem_wiki/domain/database/temtem_dao.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';
import 'package:temtem_wiki/gui/pages/home/home_page.dart';

void main() async {
  await DatabaseDao().init();
  await TemtemDao.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      // temtemProvider.temtemList = await ScrappingService.getTemtemData();
      //await TemtemDao.drop();
      // await temtemProvider.updateDb();
      //debugPrint("${(await TemtemDao.findByNumber(1))?.toMap()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TemtemProvider())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
