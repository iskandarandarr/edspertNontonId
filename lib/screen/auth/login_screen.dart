import 'package:edspert_final_project/screen/menu/bottom_navigation_screen.dart';
import '../../core/navigation/edspert_navigation.dart';
import '../../screen/auth/register_screen.dart';
import '../../utils/widgets/edspert_button.dart';
import '../../utils/widgets/edspert_text_nonton_id.dart';
import '../../utils/widgets/edspert_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 192),
                  EdspertNontonId.apply(),
                  const SizedBox(height: 104),
                  Text(
                    "Masuk",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 32),
                  EdspertTextField.textField(
                    hintText: "username",
                    icon: Icons.account_circle_outlined,
                  ),
                  const SizedBox(height: 8),
                  EdspertTextField.textField(
                    hintText: "password",
                    icon: Icons.lock_outline,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum punya akun? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          EdspertNavigation()
                              .pushNamed(RegisterScreen.routeName);
                        },
                        child: const Text(
                          "Daftar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: EdspertButton().primary(
                text: "Masuk",
                onTap: () {
                  _onTapButtonLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapButtonLogin() {
    EdspertNavigation().pushReplacementNamed(BottomNavigationScreen.routeName);
  }
}
