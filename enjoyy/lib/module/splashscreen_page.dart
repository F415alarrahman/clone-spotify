import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:enjoyy/core/utils/assets_path.dart';
import 'package:enjoyy/module/splashscreen_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashscreenNotifier(context: context),
      child: Consumer<SplashscreenNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            body: FlutterSplashScreen.scale(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              childWidget: SizedBox(
                height: 128,
                child: Image.asset(ImageAssets.spotify),
              ),
              duration: const Duration(milliseconds: 1500),
              animationDuration: const Duration(milliseconds: 1000),
              onAnimationEnd: () {
                value.pertama();
              },
            ),
          );
        },
      ),
    );
  }
}
