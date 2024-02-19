part of 'splash_screen.dart';

extension SplashView on _SplashScreenState {
  Widget _build(BuildContext context) {
    return BaseScaffold(
      body: Center(
          child: Image.asset(
        "assets/icons/foodage_icon_transparent.png",
        width: 240,
      )),
    );
  }
}
