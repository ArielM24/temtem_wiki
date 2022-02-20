import 'dart:io';

import 'package:flutter/material.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';
import 'package:temtem_wiki/gui/pages/details_page/details_page.dart';
import 'package:temtem_wiki/gui/theme/theme.dart';

class HomePageListItem extends StatelessWidget {
  final Temtem temtem;
  const HomePageListItem({Key? key, required this.temtem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppTheme.primaryColor)),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Wrap(children: [
          (temtem.normalImageFile.isEmpty)
              ? Image.network(temtem.iconImage, height: 60, width: 60)
              : Image.file(File(temtem.normalImageFile), height: 60, width: 60),
          const SizedBox(width: 10),
          Text(temtem.name),
        ]),
        leading: Text("#${temtem.number}"),
        onTap: () {
          TemtemProvider().temtem = temtem;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return const DetailsPage();
          }));
        },
      ),
    );
  }
}
