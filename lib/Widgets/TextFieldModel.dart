import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField(
      {required this.myController,
      required this.fieldName,
      required this.myIcon,
      required this.iconColor,
      required this.keyboard,
      required this.validator,
      required this.errorMessage,
      required this.obscureText,
      required this.onSaved,
      super.key});

  final TextEditingController myController;
  final fieldName;
  final TextInputType keyboard;
  final IconData myIcon;
  Color iconColor;
  String errorMessage;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboard,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          myIcon,
          color: iconColor,
        ),
        labelText: fieldName,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      validator: validator,
      onSaved: onSaved,
    );
  }
}
