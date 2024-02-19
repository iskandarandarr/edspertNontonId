import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EdspertButton {
  Widget primary({
    required String text,
    required Function() onTap,
    bool isIcon = false,
    Widget? icon,
    EdgeInsetsGeometry? margin =
        const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: margin,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              EdspertColor.purple,
              EdspertColor.purple2,
            ],
          ),
        ),
        child: Center(
          child: !isIcon
              ? Text(
                  text,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon!,
                    const SizedBox(width: 10),
                    Text(
                      text,
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
