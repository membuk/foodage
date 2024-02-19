import 'package:flutter/material.dart';
import 'package:foodageapp/providers/utils.dart';
import 'package:foodageapp/widgets/snackbar.dart';

class BaseFutureBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final Widget Function(AsyncSnapshot<T> snapshot) builder;

  const BaseFutureBuilder({required this.builder, this.future, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback(
              (_) => AlertWidgets.showError(error: snapshot.error));
        }

        if (future != null &&
            (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting)) {
          return Center(
              child: CircularProgressIndicator(
                  color: Utils.appColor.primaryColor));
        }

        return builder(snapshot);
      },
    );
  }
}
