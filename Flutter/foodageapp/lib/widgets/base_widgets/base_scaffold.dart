import 'package:flutter/material.dart';
import 'package:foodageapp/providers/utils.dart';

class BaseScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final double safeAreaPadding;
  final bool resizeToAvoidBottomInset;

  const BaseScaffold({
    this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.drawer,
    this.safeAreaPadding = 4.0,
    this.resizeToAvoidBottomInset = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Utils.appColor.backgroundColor),
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          floatingActionButton: floatingActionButton,
          appBar: appBar,
          bottomNavigationBar: bottomNavigationBar,
          drawer: drawer,
          body: SafeArea(
              minimum: EdgeInsets.all(safeAreaPadding),
              child: body ?? Container()),
        ));
  }
}
