import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../pcp_controller.dart';

class ListtilesizeWidget extends StatelessWidget {

  var sizeGeral;
  var sizeCont;
  var sizeFontTile;
  var sizeFontSubTile;
  var line;
  var threeLine;
  String title;
  String subTile;


  ListtilesizeWidget({this.sizeGeral, this.sizeCont,
    this.sizeFontTile, this.sizeFontSubTile, this.line, this.threeLine,
    this.title, this.subTile});

  final controller = Modular.get<PcpController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: controller.getSize(sizeGeral, sizeCont),
      child: ListTile(
        isThreeLine: threeLine ?? false,
        contentPadding: EdgeInsets.all(6),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: controller.getSize(sizeGeral, sizeFontTile)*0.75, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subTile,
          maxLines: line ?? 1,
          style: TextStyle(
              fontSize: controller.getSize(sizeGeral, sizeFontSubTile)*0.75),
        ),
      ),
    );
  }
}
