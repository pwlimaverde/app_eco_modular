import 'package:eco_web_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:eco_web_mobx/app/shared/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import '../../../../../app_module.dart';

final store = AppModule.to.get<LoginbuttonController>();

class DropdownbuttonWidget extends StatefulWidget {

  @override
  _DropdownbuttonWidgetState createState() => _DropdownbuttonWidgetState();
}

class _DropdownbuttonWidgetState extends State<DropdownbuttonWidget> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: [
        DropdownMenuItem<String>(
          child: InkWell(
            child: Row(
              children: <Widget>[
                Icon(Icons.star),
                SizedBox(
                  width: 30,
                ),
                Text("Favoritos"),
              ],
            ),
            onTap: () => print("Menu dow"),
          ),
          value: 'one',
        ),
        DropdownMenuItem<String>(
          child: Row(
            children: <Widget>[
              Icon(Icons.filter_2),
              Text('Item 2'),
            ],
          ),
          value: 'two',
        ),
        DropdownMenuItem<String>(
          child: Row(
            children: <Widget>[
              Container(
                height: 20,
                width: 20,
                color: Colors.black,
              ),
              Icon(Icons.filter_3),
              Text('Item 3'),
            ],
          ),
          value: 'three',
        ),
      ],
      isExpanded: false,
      onChanged: (String value) {
        setState(() {
          _value = value;
        });
      },
      hint: Text('Select Item'),
      value: _value,
      underline: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))
        ),
      ),
      style: TextStyle(
        color: Colors.black,
      ),
      iconEnabledColor: Colors.black,
      //        iconDisabledColor: Colors.grey,
    );
  }
}
