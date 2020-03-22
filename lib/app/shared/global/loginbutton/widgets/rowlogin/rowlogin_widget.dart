import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RowloginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Center(
          child: IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              _navLoginPage();
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

_navLoginPage() {
  return Modular.to.pushNamed("/login");
}
