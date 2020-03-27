import 'package:flutter/material.dart';

class ErrorrefreshWidget extends StatelessWidget {
  var onRefresh;
  String msg;


  ErrorrefreshWidget({this.onRefresh, this.msg});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Text(
                msg,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      onRefresh: onRefresh,
    );
  }
}
