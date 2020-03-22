import 'package:flutter/material.dart';

class TilelistWidget extends StatefulWidget {
  var iconLead;
  String title;
  String subtitle;
  var iconTrai;
  Function onTap;


  TilelistWidget(this.title, this.subtitle, {this.iconLead,  this.iconTrai,
      this.onTap});

  @override
  _TilelistWidgetState createState() => _TilelistWidgetState();
}

class _TilelistWidgetState extends State<TilelistWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.iconLead,
      title: Text("${widget.title}"),
      subtitle: Text("${widget.subtitle}"),
      trailing: widget.iconTrai,
      onTap: widget.onTap,
    );
  }
}