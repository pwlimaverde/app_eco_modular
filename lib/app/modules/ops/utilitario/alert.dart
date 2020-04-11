import 'package:flutter/material.dart';

alertLogin(BuildContext context, String msg){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
            return AlertDialog(
                title: Text("Login"),
                content: Text(msg),
                actions: <Widget>[
                    FlatButton(
                        child: Text("Ok"),
                        onPressed: (){
                            Navigator.pop(context);
                        }
                    )
                ],
            );
    }
    );
}

alertProgress(BuildContext context, String msg){
    showDialog(
        barrierDismissible: false,
            context: context,
            builder: (context){
                return AlertDialog(
                    title: Text("Conectando..."),
                    content: Text(msg),
                    actions: <Widget>[
                        CircularProgressIndicator(),
                    ],
                );
            }
    );
}