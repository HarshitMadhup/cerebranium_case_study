import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/palatte.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {this.icon,
      this.hint,
      this.inputType,
      this.inputAction,
      this.controller});

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[700].withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
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
