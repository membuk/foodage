import 'package:flutter/material.dart';
import 'package:foodageapp/providers/translation.dart';
import 'package:foodageapp/providers/utils.dart';
import 'package:foodageapp/services/ai_api.dart';
import 'package:foodageapp/widgets/base_widgets/base_bottomnavbar.dart';
import 'package:foodageapp/widgets/base_widgets/base_futurebuilder.dart';
import 'package:foodageapp/widgets/base_widgets/base_scaffold.dart';
import 'package:foodageapp/widgets/selection_widgets/custom_dropdownbutton.dart';
import 'package:foodageapp/widgets/snackbar.dart';

part 'test_view.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  static const String route = "/test";

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool loading = false;
  late final Future<Map<String, dynamic>?> foodNameFuture;
  String? appetizer, main, beverage, other;
  int? expectedNumber;

  @override
  void initState() {
    super.initState();

    foodNameFuture = AiAPI.getFoodNames();
  }

  Future<void> guessNumber() async {
    setState(() => loading = true);
    List<String?> list = [appetizer, main, beverage, other];
    if (list.contains(null)) {
      AlertWidgets.showError(error: "Bütün verileri girin."); // TODO

      return;
    }

    expectedNumber =
        await AiAPI.calculateExpectedNumber(List<String>.from(list));
    setState(() => loading = false);
  }

  void localSetState({Function()? func}) => setState(func ?? () {});

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }
}
