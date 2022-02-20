import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temtem_wiki/domain/provider/temtem_provider.dart';

class InfoHeader extends StatefulWidget {
  const InfoHeader({Key? key}) : super(key: key);

  @override
  State<InfoHeader> createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  bool luma = false;
  bool lumaButton = false;
  // late TemtemProvider temtemProvider = Provider.of<TemtemProvider>(context);
  // late Temtem temtem = temtemProvider.temtem;
  @override
  Widget build(BuildContext context) {
    // bool normalBytesEmpty = context.select<TemtemProvider, bool>(
    //     (p) => p.temtem.normalBytes?.isEmpty ?? true);
    bool lumaBytesEmpty = context
        .select<TemtemProvider, bool>((p) => p.temtem.lumaImageFile.isEmpty);
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
                child: Consumer<TemtemProvider>(builder: (context, p, _) {
                  if (p.temtem.normalImageFile.isEmpty) {
                    return Image.network(
                      selectImage(),
                      width: 50,
                      height: 50,
                    );
                  }
                  if (luma) {
                    debugPrint("luma");
                    return Image.file(
                      File(TemtemProvider().temtem.lumaImageFile),
                      width: 50,
                      height: 50,
                    );
                  }
                  return Image.file(
                    File(TemtemProvider().temtem.normalImageFile),
                    width: 50,
                    height: 50,
                  );
                }),
              )),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<TemtemProvider>(
                    builder: (context, p, _) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue[900]),
                          onPressed: (p.temtem.normalImageFile.isEmpty)
                              ? null
                              : onNormalClick,
                          child: const SizedBox(
                              width: 100,
                              child: Center(child: Text("Normal"))));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[900]),
                      onPressed: (lumaBytesEmpty) ? null : onLumaClick,
                      child: const SizedBox(
                          width: 100, child: Center(child: Text("Luma")))),
                ),
              ],
            ))
      ],
    );
  }

  String selectImage() {
    bool lumaImage = TemtemProvider().temtem.lumaImage.isEmpty;
    bool notImage = TemtemProvider().temtem.image.isEmpty;
    debugPrint("select");
    if (luma) {
      if (lumaImage) {
        return TemtemProvider().temtem.lumaImage;
      }
    }
    if (notImage) {
      return TemtemProvider().temtem.iconImage;
    }
    return TemtemProvider().temtem.image;
  }

  onLumaClick() {
    setState(() {
      luma = true;
    });
  }

  onNormalClick() {
    setState(() {
      luma = false;
    });
  }
}
