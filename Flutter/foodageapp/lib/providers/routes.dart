import 'package:flutter/material.dart';
import 'package:foodageapp/screens/information/information_screen.dart';
import 'package:foodageapp/screens/settings/settings_screen.dart';
import 'package:foodageapp/screens/splash/splash_screen.dart';
import 'package:foodageapp/screens/test/test_screen.dart';
import 'package:foodageapp/screens/train/train_screen.dart';

class Routes {
  static const String initialRoute = SplashScreen.route;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Map<String, Widget Function(BuildContext)> routes = {
    SplashScreen.route: (context) => const SplashScreen(),
    InformationScreen.route: (context) => const InformationScreen(),
    TestScreen.route: (context) => const TestScreen(),
    TrainScreen.route: (context) => const TrainScreen(),
    SettingsScreen.route: (context) => const SettingsScreen(),
  };

  static Route<Widget> generateRoute(RouteSettings settings) {
    late Widget page =
        Routes.routes[settings.name]!(Routes.navigatorKey.currentContext!);

    return PageRouteBuilder(
        settings: RouteSettings(name: settings.name),
        pageBuilder: (_, __, ___) => page);
  }

  static Future<dynamic> pushNamed(routePath,
      {dynamic arg, bool replace = false}) {
    if (replace) pop();

    return navigatorKey.currentState!.pushNamed(routePath, arguments: arg);
  }

  static Future<dynamic> replace(routePath, {dynamic arg}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routePath, arguments: arg);
  }

  static void pop({dynamic data}) {
    navigatorKey.currentState!.pop(data);
  }

  static void popAll({force = false}) {
    while (navigatorKey.currentState!.canPop()) {
      pop();
    }
    if (force) pop();
  }
}
