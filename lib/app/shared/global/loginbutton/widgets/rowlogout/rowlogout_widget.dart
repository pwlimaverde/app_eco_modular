import 'package:flutter/material.dart';
import '../../../../../app_module.dart';
import '../../loginbutton_controller.dart';

class RowlogoutWidget extends StatefulWidget {

  var user;

  RowlogoutWidget(this.user);

  @override
  _RowlogoutWidgetState createState() => _RowlogoutWidgetState();
}

class _RowlogoutWidgetState extends State<RowlogoutWidget> {

  final controller = AppModule.to.get<LoginbuttonController>();

  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Icon(Icons.account_box),
        Container(
          height: 10,
          width: 10,
        ),
        Text("Bem vindo ${widget.user}"),
        Center(
          child: IconButton(
            icon: Icon(Icons.input),
            onPressed: () {
              controller.logout();
            },
          ),
        ),
        Container(
          height: 10,
          width: 10,
        ),
      ],
    );
  }
}