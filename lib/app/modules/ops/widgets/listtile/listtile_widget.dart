import 'package:eco_web_mobx/app/shared/model/ops_model.dart';
import 'package:flutter/material.dart';


class ListtileWidget extends StatelessWidget {

  final OpsModel model;
  Function onPressed;

  ListtileWidget({this.model, this.onPressed});

//  const ListtileWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          "OP: ${model.op} - Cliente: ${model.cliente}"),
      subtitle: Text("${model.servico}"),
      trailing: IconButton(
        icon: Icon(
          Icons.check,
          size: 22,
          color: Colors.green,
        ),
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
      ),
    );
  }
}
