import 'package:flutter/material.dart';

class TableCellName extends StatelessWidget {
  final String property;
  const TableCellName({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white12),
          color: Colors.blue[900],
        ),
        height: 43,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            property,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
