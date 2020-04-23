import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import '../../../../../app_controller.dart';

class CheckboxWidget extends StatelessWidget {
  var sizeGeral;
  var sizeCont;
  var sizeFontTile;
  var value;
  Function ontap;
  Function onChanged;
  String title;
  String labelT;
  bool alingL;
  double heightT;

  CheckboxWidget({
    this.sizeGeral,
    this.sizeCont,
    this.sizeFontTile,
    this.title,
    this.labelT,
    this.alingL = false,
    this.heightT,
    this.ontap,
    this.onChanged,
    this.value,
  });

  final controller = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return _buildContainer2();
  }

  _buildContainer2() {
    return Card(
      elevation: 0.5,
      child: Container(
//      color: Colors.greenAccent,
        padding: EdgeInsets.all(0),
        width: controller.getSize(sizeGeral, sizeCont),
        child: ListTile(
          onTap: ontap,
          contentPadding: EdgeInsets.all(2),
          title: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
//              CustomCheckBoxGroup(
//                buttonColor: Colors.grey,
//                buttonLables: [
//                  "Monday",
//                  "Tuesday",
//                ],
//                buttonValuesList: [
//                  "Monday",
//                  "Tuesday",
//                ],
//                checkBoxButtonValues: (values) {
//                  print(values);
//                },
//                defaultSelected: "Monday",
//                horizontal: true,
//                width: 20,
//                 hight: 20,
//                selectedColor: Colors.greenAccent,
//                padding: 5,
//                // enableShape: true,
//              ),
//              Checkbox(
//                value: value ?? false,
//                onChanged: onChanged,
//              ),
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
        ),
      ),
    );
  }
}
