import 'package:flutter/material.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';

class DetailsPage extends StatefulWidget {
  final Temtem temtem;
  const DetailsPage({Key? key, required this.temtem}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.temtem.name),
      ),
      body: Center(
        child: Text(widget.temtem.name),
      ),
    );
  }
}
