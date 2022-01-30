import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/model/temtem.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';

class InfoHeader extends StatefulWidget {
  const InfoHeader({Key? key}) : super(key: key);

  @override
  State<InfoHeader> createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  bool luma = false;
  late TemtemProvider temtemProvider = Provider.of<TemtemProvider>(context);
  late Temtem temtem = temtemProvider.temtem;
  @override
  Widget build(BuildContext context) {
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
                  selectImage(),
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
                      onPressed: onNormalClick,
                      child: const SizedBox(
                          width: 100, child: Center(child: Text("Normal")))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[900]),
                      onPressed: onLumaClick,
                      child: const SizedBox(
                          width: 100, child: Center(child: Text("Luma")))),
                ),
              ],
            ))
      ],
    );
  }

  String selectImage() {
    bool lumaImage = temtem.lumaImage.isEmpty;
    bool notImage = temtem.image.isEmpty;
    debugPrint("select");
    if (luma) {
      if (lumaImage) {
        return temtem.lumaImage;
      }
    }
    if (notImage) {
      return temtem.iconImage;
    }
    return temtem.image;
  }

  onLumaClick() {
    setState(() {
      luma = true;
    });
  }

  onNormalClick() {
    debugPrint("normal");
    setState(() {
      luma = false;
    });
  }
}
