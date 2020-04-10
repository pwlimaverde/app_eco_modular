import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../app_controller.dart';

class OpslisttileWidget extends StatelessWidget {
  var sizeGeral;
  var sizeCont;
  var sizeFontTile;
  var sizeFontSubTile;
  var line;
  bool threeLine;
  String title;
  String labelT;
  String labelS;
  String subTile;
  bool alingL;
  double heightT;
  double heightS;

  OpslisttileWidget({
    this.sizeGeral,
    this.sizeCont,
    this.sizeFontTile,
    this.sizeFontSubTile,
    this.line,
    this.threeLine,
    this.title,
    this.labelT,
    this.labelS,
    this.subTile,
    this.alingL = false,
    this.heightT,
    this.heightS,
  });

  final controller = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return _buildContainer2();
  }

  _buildContainer() {
    return Card(
      elevation: 0.5,
      child: Container(
//      color: Colors.greenAccent,
        padding: EdgeInsets.all(0),
        width: controller.getSize(sizeGeral, sizeCont),
        child: ListTile(
          isThreeLine: threeLine ?? false,
          contentPadding: EdgeInsets.all(4),
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: controller.getSize(sizeGeral, sizeFontTile) * 0.75,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subTile,
            maxLines: line ?? 1,
            style: TextStyle(
                fontSize:
                    controller.getSize(sizeGeral, sizeFontSubTile) * 0.75),
          ),
        ),
      ),
    );
  }

  _buildContainer2() {
    return Card(
      elevation: 0.5,
      child: Container(
//      color: Colors.greenAccent,
        padding: EdgeInsets.all(0),
        width: controller.getSize(sizeGeral, sizeCont),
        child: ListTile(
          isThreeLine: threeLine ?? false,
          contentPadding: EdgeInsets.all(2),
          title: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
                  ),
                ),
                alignment: alingL ? Alignment(-1.0, 0.0) : Alignment(0.0, 0.0),
                height: heightT,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize:
                          controller.getSize(sizeGeral, sizeFontTile) * 0.75,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Text(
                  labelT ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize:
                          controller.getSize(sizeGeral, sizeFontTile) * 0.45,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          subtitle: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
//              color: Colors.greenAccent,
                alignment: alingL ? Alignment(-1.0,-0.0) : Alignment(0.0, 0.0),
                height: heightS,
                child: Text(
                  subTile,
                  maxLines: line ?? 1,
                  style: TextStyle(
                      fontSize: controller.getSize(sizeGeral, sizeFontSubTile) *
                          0.65),
                ),
              ),
              Positioned(
                top: 1,
                left: 0,
                child: Text(
                  labelS ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: controller.getSize(sizeGeral, sizeFontSubTile) *
                          0.45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
