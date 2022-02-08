import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';
import 'package:temtem_wiki/gui/pages/home/widgets/home_pady_body_item.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isNotEmpty = context.select<TemtemProvider, bool>(
        (TemtemProvider p) => p.temtemList.isNotEmpty);
    if (isNotEmpty) {
      return Consumer<TemtemProvider>(
        builder: (BuildContext context, TemtemProvider p, _) {
          return ListView.builder(
              itemCount: p.temtemList.length,
              itemBuilder: (BuildContext context, int index) {
                return HomePageListItem(temtem: p.temtemList[index]);
              });
        },
      );
    }
    return const Center(
      child: Text("nothing to see here"),
    );
  }
}
