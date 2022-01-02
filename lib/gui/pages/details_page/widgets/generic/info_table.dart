import 'package:flutter/material.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/generic/widgets/table_cell_property.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/generic/widgets/table_cell_value.dart';

class InfoTable extends StatelessWidget {
  final Temtem temtem;
  const InfoTable({Key? key, required this.temtem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        //border: TableBorder.all(color: Colors.blue[900]!),
        children: [
          Row(children: [
            const TableCellProperty(property: "Number"),
            TableCellValue(value: Text(temtem.number))
          ]),
          const Divider(),
          Row(children: [
            const TableCellProperty(property: "Types"),
            TableCellValue(
              value: Row(
                children: [
                  Image.network(temtem.typeImages.first),
                  if (temtem.typeImages.length > 1)
                    Image.network(temtem.typeImages[1]),
                ],
              ),
            )
          ])
        ],
      ),
    );
  }
}
