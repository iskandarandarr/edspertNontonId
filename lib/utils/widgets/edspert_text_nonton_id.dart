import '../../utils/edspert_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EdspertNontonId {
  static Widget apply() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "NONTON",
          style: GoogleFonts.exo(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700),
        ),
        Text(
          "·ID",
          style: GoogleFonts.exo(
              color: EdspertColor.yellow,
              fontSize: 40,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
