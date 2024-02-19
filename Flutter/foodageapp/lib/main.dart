import 'package:flutter/material.dart';
import 'package:foodageapp/providers/routes.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      navigatorKey: Routes.navigatorKey,
      onGenerateRoute: Routes.generateRoute));
}
