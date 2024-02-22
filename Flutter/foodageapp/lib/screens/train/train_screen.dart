import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:foodageapp/providers/routes.dart';
import 'package:foodageapp/providers/translation.dart';
import 'package:foodageapp/providers/utils.dart';
import 'package:foodageapp/services/ai_api.dart';
import 'package:foodageapp/widgets/base_widgets/base_bottomnavbar.dart';
import 'package:foodageapp/widgets/base_widgets/base_scaffold.dart';
import 'package:foodageapp/widgets/snackbar.dart';

part 'train_view.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({super.key});

  static const String route = "/train";

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  bool loading = false;
  File? file;
  List<String> all = [],
      appetizers = [],
      mains = [],
      beverages = [],
      others = [];

  Future<void> selectCsvFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);

      final List<List<dynamic>> fields = await file!
          .openRead()
          .transform(utf8.decoder)
          .transform(const CsvToListConverter())
          .toList();

      all = [];
      for (List<dynamic> row in fields) {
        all.add(row.first.split(';')[0]);
      }
      all.removeAt(0);
      all.removeLast();
    }

    setState(() {});
  }

  Future<void> trainMachine() async {
    setState(() => loading = true);
    Map<String, dynamic>? map = await AiAPI.trainAI(file!, {
      'all': all,
      'appetizers': appetizers,
      'mains': mains,
      'beverages': beverages,
      'others': others
    });
    setState(() => loading = false);

    if (map != null) {
      AlertWidgets.showSuccess(text: "Trained successully.");
    }
  }

  void localSetState(Function()? func) => setState(func ?? () {});

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }
}
