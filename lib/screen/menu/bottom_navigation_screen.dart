import 'package:edspert_final_project/screen/menu/cinema_screen.dart';
import 'package:edspert_final_project/screen/menu/home_screen.dart';
import 'package:edspert_final_project/screen/menu/profile_screen.dart';
import 'package:edspert_final_project/screen/menu/ticket_screen.dart';
import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:edspert_final_project/utils/svg_dir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigationScreen extends StatelessWidget {
  static const routeName = '/bottom-navigation-screen';
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: EdspertColor.primaryColor,
      resizeToAvoidBottomInset: true,
      navBarHeight: 90,
      navBarStyle: NavBarStyle.style6,
      decoration: const NavBarDecoration(
        colorBehindNavBar: EdspertColor.primaryColor,
      ),
      screens: _buildScreens(),
      items: [
        _bottomNavigationBar(
          SvgDir.home,
          "Home",
        ),
        _bottomNavigationBar(
          SvgDir.ticket,
          "Ticket",
        ),
        _bottomNavigationBar(
          SvgDir.bioskop,
          "Bioskop",
        ),
        _bottomNavigationBar(
          SvgDir.user,
          "User",
        ),
      ],
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const TicketScreen(),
      const CinemaScreen(),
      const ProfileScreen(),
    ];
  }
}

PersistentBottomNavBarItem _bottomNavigationBar(
  String svgDir,
  String title,
) {
  return PersistentBottomNavBarItem(
    icon: SvgPicture.asset(
      svgDir,
      colorFilter: const ColorFilter.mode(EdspertColor.yellow, BlendMode.srcIn),
    ),
    inactiveIcon: SvgPicture.asset(
      svgDir,
    ),
    iconSize: 24,
    title: title,
    activeColorPrimary: EdspertColor.yellow,
    inactiveColorPrimary: Colors.white,
    textStyle: GoogleFonts.openSans(
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
  );
}
