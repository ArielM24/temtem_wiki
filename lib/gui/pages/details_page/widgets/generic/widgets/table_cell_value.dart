import 'package:flutter/material.dart';

class TableCellValue extends StatelessWidget {
  final Widget value;
  const TableCellValue({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          height: 43,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blue[900]!)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: value,
          ),
        ));
  }
}
