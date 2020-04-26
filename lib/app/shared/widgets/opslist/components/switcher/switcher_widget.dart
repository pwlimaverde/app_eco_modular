import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../opslist_controller.dart';


class SwitcherWidget extends StatelessWidget {

  Function onTap;
  String title;
  bool crtL;
  bool crtC;
  bool mini = false;
  DateTime imp;
  bool impOK = false;


  SwitcherWidget({this.onTap, this.title, this.crtL, this.crtC, this.mini, this.imp, this.impOK});

  final controller = Modular.get<OpslistController>();
  @override
  Widget build(BuildContext context) {
    return impOK == true? _inkWellImp(crtC):mini == true ?_inkWellMini(crtL):_inkWell(crtL, crtC);
  }

  _inkWell(bool crtL, bool crtC) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Text(title, style: TextStyle(fontWeight: crtC==false?crtL == true ? FontWeight.bold : FontWeight.normal : FontWeight.bold, fontSize: 14),),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 40,
            height: 15,
            alignment: crtC==false?crtL == true ?Alignment.topRight : Alignment.topLeft : Alignment.topRight,
            decoration: BoxDecoration(
              color: crtC==false?crtL == true ? Colors.green[100] : Colors.grey[100] : Colors.green[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: crtC==false?crtL == true ? Colors.green : Colors.grey:Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
      onTap: imp != null ? null:onTap,
    );
  }

  _inkWellMini(bool crtL) {
    return InkWell(
      child: Container(
        height: 15,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey[300]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontWeight:
                crtL == true ? FontWeight.bold : FontWeight.normal,
                fontSize: 11,
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 30,
              height: 10,
              alignment:
              crtL == true ? Alignment.topRight : Alignment.topLeft,
              decoration: BoxDecoration(
                color: crtL == true ? Colors.green[100] : Colors.grey[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: crtL == true ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: imp != null ? null:onTap,
    );
  }

  _inkWellImp(bool crtC) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Text(title, style: TextStyle(fontWeight: crtC==false? imp != null ? FontWeight.bold : FontWeight.normal : FontWeight.bold, fontSize: 14),),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 40,
            height: 15,
            alignment: crtC==false ? imp != null ? Alignment.topRight : Alignment.topLeft : Alignment.topRight,
            decoration: BoxDecoration(
              color: crtC==false ? imp != null ? Colors.green[100] : Colors.grey[100] : Colors.green[100],
              borderRadius: BorderRadius.circular(5),
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: crtC==false ? imp != null ? Colors.green : Colors.grey:Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}


