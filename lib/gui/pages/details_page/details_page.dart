import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';
import 'package:temtem_wiki/domain/service/scrapping/scrapping_service.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/generic/generic_info.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  // late TemtemProvider temtemProvider;
  late Widget content;

  @override
  void initState() {
    super.initState();
    content = GenericInfo();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      if (TemtemProvider().temtem.normalBytes?.isEmpty ?? true) {
        Future.delayed(const Duration(seconds: 1)).then((_) async {
          TemtemProvider().updateInfo(await ScrappingService.completeTemtemInfo(
              TemtemProvider().temtem));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("${TemtemProvider().temtem.name}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Consumer<TemtemProvider>(
            builder: (context, TemtemProvider p, _) => Text(p.temtem.name)),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomBarOnTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: Colors.blue[900],
              ),
              label: "Info"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_fix_normal_sharp,
                color: Colors.blue[900],
              ),
              label: "Moves"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.upgrade,
                color: Colors.blue[900],
              ),
              label: "Evolutions"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
                color: Colors.blue[900],
              ),
              label: "Location"),
        ],
      ),
    );
  }

  bottomBarOnTap(int index) {
    // if (index == 0) {
    //   content = GenericInfo();
    //   setState(() {});
    // } else if (index == 1) {
    //   content = MovesInfo();
    //   setState(() {});
    // }
  }
}
