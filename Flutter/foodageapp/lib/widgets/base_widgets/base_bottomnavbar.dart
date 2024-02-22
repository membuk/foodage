import 'package:flutter/material.dart';
import 'package:foodageapp/providers/routes.dart';
import 'package:foodageapp/providers/utils.dart';
import 'package:foodageapp/screens/information/information_screen.dart';
import 'package:foodageapp/screens/settings/settings_screen.dart';
import 'package:foodageapp/screens/test/test_screen.dart';
import 'package:foodageapp/screens/train/train_screen.dart';

class BaseBottomNavigationBar extends StatefulWidget {
  final int initialIndex;

  const BaseBottomNavigationBar({required this.initialIndex, super.key});

  @override
  State<BaseBottomNavigationBar> createState() =>
      _BaseBottomNavigationBarState();
}

class _BaseBottomNavigationBarState extends State<BaseBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
        length: 4, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          return states.contains(MaterialState.focused)
              ? null
              : Colors.transparent;
        }),
        controller: controller,
        unselectedLabelColor: Utils.appColor.inactiveColor,
        labelColor: Utils.appColor.primaryColor,
        indicatorColor: Utils.appColor.primaryColor,
        dividerColor: Colors.transparent,
        onTap: (index) {
          if (widget.initialIndex == index) return;

          switch (index) {
            case 0:
              Routes.pushNamed(InformationScreen.route);
              break;
            case 1:
              Routes.pushNamed(TestScreen.route);
              break;
            case 2:
              Routes.pushNamed(TrainScreen.route);
              break;
            case 3:
              Routes.pushNamed(SettingsScreen.route);
              break;
            default:
          }
        },
        tabs: const [
          Tab(icon: Icon(Icons.info_outline)),
          Tab(icon: Icon(Icons.bar_chart)),
          Tab(icon: Icon(Icons.cloud_upload)),
          Tab(icon: Icon(Icons.settings_rounded)),
        ],
      ),
    );
  }
}
