import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EdspertTextField {
  static Widget textField({
    required String hintText,
    required IconData icon,
    double marginContainer = 42,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginContainer),
      decoration: BoxDecoration(
        color: EdspertColor.secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: (String value) {},
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.openSans(
            color: Colors.white.withOpacity(0.2),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(0.2),
          ),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
