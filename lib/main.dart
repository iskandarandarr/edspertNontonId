import './core/navigation/edspert_navigation.dart';
import './screen/splash_screen.dart';
import './utils/edspert_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: EdspertColor.primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: EdspertColor.primaryColor,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.openSans(textStyle: textTheme.bodyMedium),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: EdspertNavigation.routes,
      navigatorKey: EdspertNavigation.navigatorKey,
    );
  }
}
