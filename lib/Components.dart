import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RectangularRoundedButton extends StatelessWidget {
  const RectangularRoundedButton(
      {Key key,
      @required this.materialAccentColor,
      @required this.buttonString,
      @required this.onPressed})
      : super(key: key);

  final MaterialAccentColor materialAccentColor;
  final String buttonString;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: materialAccentColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonString,
          ),
        ),
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField(
      {Key key,
      @required this.padding,
      @required this.border,
      @required this.enabledBorder,
      @required this.focusedBorder,
      @required this.hintText,
      this.obscureText,
      this.onChange})
      : super(key: key);

  final EdgeInsets padding;
  final OutlineInputBorder border;
  final OutlineInputBorder enabledBorder;
  final OutlineInputBorder focusedBorder;
  final Function onChange;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.grey),
        hintText: hintText,
        contentPadding: padding,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
      ),
    );
  }
}
