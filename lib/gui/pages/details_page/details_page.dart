import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';
import 'package:temtem_wiki/domain/service/scrapping/scrapping_service.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/generic/generic_info.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/moves_info.dart';

class DetailsPage extends StatefulWidget {
  final Temtem temtem;
  const DetailsPage({Key? key, required this.temtem}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late TemtemProvider temtemProvider;
  late Widget content;

  @override
  void initState() {
    super.initState();
    content = GenericInfo(temtem: widget.temtem);
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      Future.delayed(const Duration(seconds: 1)).then((_) async {
        temtemProvider.updateInfo(
            await ScrappingService.completeTemtemInfo(widget.temtem));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    temtemProvider = Provider.of<TemtemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(widget.temtem.name),
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
    if (index == 0) {
      content = GenericInfo(temtem: widget.temtem);
      setState(() {});
    } else if (index == 1) {
      content = MovesInfo(temtem: widget.temtem);
      setState(() {});
    }
  }
}
