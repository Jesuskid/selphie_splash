import 'package:flutter/material.dart';


class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.text,
    this.change

  }) : super(key: key);

  final String text;
  final ValueChanged<String>? change;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        onChanged: change,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: text,
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),
          focusColor: Colors.white,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),

        ),
      ),
    );
  }
}