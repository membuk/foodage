import 'package:flutter/material.dart';
import 'package:foodageapp/providers/routes.dart';
import 'package:foodageapp/providers/translation.dart';
import 'package:foodageapp/screens/information/information_screen.dart';
import 'package:foodageapp/widgets/base_widgets/base_scaffold.dart';

part 'splash_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> initializeApp() async {
    await Translation.loadLanguage();

    await Future.delayed(const Duration(seconds: 1));
    try {
      Routes.pushNamed(InformationScreen.route);
    } catch (_) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => Routes.pushNamed(InformationScreen.route));
    }
  }

  @override
  void initState() {
    super.initState();

    initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }
}
