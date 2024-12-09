import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  String HintText;
  Text LabelText;
  TextEditingController controller;
  bool ObscureText;

  MyTextField({
    super.key,
    required this.HintText,
    required this.LabelText,
    required this.controller,
    required this.ObscureText,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.ObscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.HintText,
          label: widget.LabelText,
        ),
      ),
    );
  }
}
