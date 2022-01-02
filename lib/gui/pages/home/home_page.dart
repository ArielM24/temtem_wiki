import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';
import 'package:temtem_wiki/domain/service/scrapping_service.dart';
import 'package:temtem_wiki/gui/pages/home/widgets/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TemtemProvider temtemProvider = Provider.of<TemtemProvider>(context);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      temtemProvider.temtemList = await ScrappingService.getTemtemData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("scrap"),
      ),
      body: HomePageBody(temtemList: temtemProvider.temtemList),
      floatingActionButton: FloatingActionButton(
        onPressed: scrap,
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }

  scrap() async {
    temtemProvider.temtemList = [];

    temtemProvider.temtemList = await ScrappingService.getTemtemData();

    setState(() {});
    await ScrappingService.getTemtemData();
    debugPrint("${temtemProvider.temtemList.length}");
  }
}
