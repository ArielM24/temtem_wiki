import 'package:flutter/material.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/generic/info_header.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/generic/info_table.dart';

class GenericInfo extends StatelessWidget {
  const GenericInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: [const InfoHeader(), const InfoTable()],
      ),
    );
  }
}
