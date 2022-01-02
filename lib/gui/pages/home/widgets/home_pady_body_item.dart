import 'package:flutter/material.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/gui/pages/details_page/details_page.dart';

class HomePageListItem extends StatelessWidget {
  final Temtem temtem;
  const HomePageListItem({Key? key, required this.temtem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Wrap(children: [
        Image.network(temtem.iconImage),
        const SizedBox(width: 10),
        Text(temtem.name),
      ]),
      leading: Text(temtem.number),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return DetailsPage(temtem: temtem);
        }));
      },
    );
  }
}
