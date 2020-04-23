import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  TextStyle style;
  String label;
  String hint;
  bool senha;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;

  FieldWidget(
      this.label,
      this.hint, {
        this.style,
        this.senha  = false,
        this.controller,
        this.validator,
        this.keyboardType,
        this.textInputAction,
        this.focusNode,
        this.nextFocus,
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      obscureText: senha,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
