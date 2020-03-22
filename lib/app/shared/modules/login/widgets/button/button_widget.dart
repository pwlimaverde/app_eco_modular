import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  String text;
  Function onPressed;
  TextStyle style;
  FocusNode focusNode;


  ButtonWidget(this.text, {this.onPressed, this.style, this.focusNode});

  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Text("${widget.text}",
            textAlign: TextAlign.center,
            style: widget.style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: widget.onPressed,
      ),
    );
  }
}
