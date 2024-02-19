import 'package:flutter/material.dart';
import 'package:foodageapp/providers/routes.dart';
import 'package:foodageapp/providers/translation.dart';
import 'package:foodageapp/providers/utils.dart';
import 'package:foodageapp/screens/information/information_screen.dart';
import 'package:foodageapp/widgets/base_widgets/base_bottomnavbar.dart';
import 'package:foodageapp/widgets/base_widgets/base_scaffold.dart';

part 'settings_view.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String route = "/settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return _build(context);
  }
}
