import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/palatte.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {this.icon,
      this.hint,
      this.inputType,
      this.inputAction,
      this.controller,
      this.validation});

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final String Function(String) validation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[500].withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField(
          // autovalidateMode: AutovalidateMode.disabled,
          validator: validation,
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.cyan, width: 1.0)),
            errorStyle: GoogleFonts.lato(color: Colors.red, fontSize: 10),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            ),
            hintStyle: kBodyText,
          ),
          style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
          keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
