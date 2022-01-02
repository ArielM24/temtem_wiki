import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TemtemProvider temtemProvider = Provider.of<TemtemProvider>(context);

    Temtem temtem = temtemProvider.temtem;
    print("header");
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue[900]!, width: 10),
                borderRadius: BorderRadius.circular(15),
              ),
              width: MediaQuery.of(context).size.height * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              child: FittedBox(
                child: Image.network(
                  temtem.image.isEmpty ? temtem.iconImage : temtem.image,
                  width: 50,
                  height: 50,
                ),
              )),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[900]),
                      onPressed: () {},
                      child: const SizedBox(
                          width: 100, child: Center(child: Text("Normal")))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[900]),
                      onPressed: () {},
                      child: const SizedBox(
                          width: 100, child: Center(child: Text("Luma")))),
                ),
              ],
            ))
      ],
    );
  }
}
