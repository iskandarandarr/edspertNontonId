import 'package:edspert_final_project/screen/content/date_place_screen.dart';
import 'package:edspert_final_project/screen/content/movie_list_screen.dart';
import 'package:edspert_final_project/screen/content/select_seat_screen.dart';
import 'package:edspert_final_project/screen/menu/bottom_navigation_screen.dart';
import '../../screen/auth/login_screen.dart';
import '../../screen/auth/register_screen.dart';
import '../../screen/content/detail_content_screen.dart';
import '../../screen/splash_screen.dart';
import 'package:flutter/material.dart';

class EdspertNavigation {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Register route
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    RegisterScreen.routeName: (context) => const RegisterScreen(),
    DetailContentScreen.routeName: (context) => const DetailContentScreen(),
    DatePlaceScreen.routeName: (context) => const DatePlaceScreen(),
    MovieListScreen.routeName: (context) => const MovieListScreen(),
    BottomNavigationScreen.routeName: (context) => const BottomNavigationScreen(),
    SelectSeatScreen.routeName: (context) => const SelectSeatScreen(),
  };

  void pushNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState!.pushReplacementNamed(routeName,
        arguments: arguments);
  }

  void push(Widget widget) {
    navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }

  void popUntil(String routeName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }
}
