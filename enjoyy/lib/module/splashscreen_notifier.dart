import 'package:enjoyy/module/auth/getstarted_page.dart';
import 'package:flutter/material.dart';

class SplashscreenNotifier extends ChangeNotifier {
  final BuildContext context;

  SplashscreenNotifier({required this.context}) {
    pertama();
  }

  pertama() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const GetstartedPage()),
          (route) => false);
    });
  }
}
