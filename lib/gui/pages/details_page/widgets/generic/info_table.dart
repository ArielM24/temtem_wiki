import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/generic/widgets/table_cell_name.dart';
import 'package:temtem_wiki/gui/pages/details_page/widgets/generic/widgets/table_cell_value.dart';

class InfoTable extends StatelessWidget {
  const InfoTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Temtem temtem = context.select<TemtemProvider, Temtem>((p) => p.temtem);
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          //border: TableBorder.all(color: Colors.blue[900]!),
          children: [
            Row(children: [
              const TableCellName(property: "Number"),
              TableCellValue(value: Text("#${temtem.number}"))
            ]),
            // const Divider(),
            Row(children: [
              const TableCellName(property: "Types"),
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
      ),
    );
  }
}
