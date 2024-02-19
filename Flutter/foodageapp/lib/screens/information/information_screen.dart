import 'package:flutter/material.dart';
import 'package:foodageapp/providers/translation.dart';
import 'package:foodageapp/providers/utils.dart';
import 'package:foodageapp/widgets/base_widgets/base_bottomnavbar.dart';
import 'package:foodageapp/widgets/base_widgets/base_scaffold.dart';

part 'information_view.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  static const String route = "/information";

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }
}
