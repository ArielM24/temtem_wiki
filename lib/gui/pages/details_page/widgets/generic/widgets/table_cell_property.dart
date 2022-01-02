import 'package:flutter/material.dart';

class TableCellProperty extends StatelessWidget {
  final String property;
  const TableCellProperty({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 43,
        color: Colors.blue[900],
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
