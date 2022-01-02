import 'package:flutter/material.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/gui/pages/home/widgets/home_pady_body_item.dart';

class HomePageBody extends StatelessWidget {
  final List<Temtem> temtemList;
  const HomePageBody({Key? key, required this.temtemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (temtemList.isNotEmpty) {
      return ListView.builder(
          itemCount: temtemList.length,
          itemBuilder: (BuildContext context, int index) {
            return HomePageListItem(temtem: temtemList[index]);
          });
    }
    return const Center(
      child: Text("nothing to see here"),
    );
  }
}
