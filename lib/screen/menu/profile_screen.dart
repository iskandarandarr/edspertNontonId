import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:edspert_final_project/utils/image_dir.dart';
import 'package:edspert_final_project/utils/svg_dir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              children: [
                const SizedBox(height: 27),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 16,
                      ),
                      Text(
                        'Back',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Container(
                  decoration: BoxDecoration(
                    color: EdspertColor.secondaryColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            ImageDir.photoProfile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 22),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'iskandar',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Since 5 January 2021',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: EdspertColor.yellow2,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Member Gold',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                Container(
                  decoration: BoxDecoration(
                    color: EdspertColor.secondaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoxMenu.menu(icon: SvgDir.wallet, title: 'Wallet'),
                      BoxMenu.menu(icon: SvgDir.point, title: 'Points'),
                      BoxMenu.menu(icon: SvgDir.voucher, title: 'Voucher'),
                      BoxMenu.menu(icon: SvgDir.payLater, title: 'PayLater'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListItem.list(
                  title: 'Aneh',
                  description:
                      'Halaman ini aneh, masa page yang ada bottom nav bar nya ada tombol back nya, ga ada aplikasi yang kaya gini, Hehe canda bang',
                ),
                const SizedBox(height: 16),
                ListItem.list(
                  title: 'Saved',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipisci',
                ),
                const SizedBox(height: 16),
                ListItem.list(
                  title: 'History',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipisci',
                ),
                const SizedBox(height: 16),
                ListItem.list(
                  title: 'My Ratings',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipisci',
                ),
                const SizedBox(height: 16),
                ListItem.list(
                  title: 'Help Center',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipisci',
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListItem {
  static Widget list({
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 14,
      ),
      decoration: BoxDecoration(
        color: EdspertColor.secondaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BoxMenu {
  static Widget menu({
    required String icon,
    required String title,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
