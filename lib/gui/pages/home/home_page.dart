import 'package:flutter/material.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/domain/service/scrapping_service.dart';
import 'package:temtem_wiki/gui/pages/home/widgets/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Temtem> temtemList = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      temtemList = await ScrappingService.getTemtemData();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("scrap"),
      ),
      body: HomePageBody(temtemList: temtemList),
      floatingActionButton: FloatingActionButton(
        onPressed: scrap,
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }

  scrap() async {
    setState(() {
      temtemList = [];
    });
    temtemList = await ScrappingService.getTemtemData();

    setState(() {});
    await ScrappingService.getTemtemData();
    debugPrint("${temtemList.length}");
  }
}
