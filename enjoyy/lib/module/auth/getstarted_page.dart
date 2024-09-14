import 'package:enjoyy/common/widget/button/basic_button.dart';
import 'package:enjoyy/core/utils/assets_path.dart';
import 'package:enjoyy/module/auth/chose_mode_page.dart';
import 'package:enjoyy/module/auth/getstarted_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetstartedPage extends StatelessWidget {
  const GetstartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GetstartedNotifier(context: context),
      child: Consumer<GetstartedNotifier>(
        builder: (context, value, child) => Scaffold(
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.gyj1),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        ImageAssets.logo,
                        height: 64,
                        width: 64,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Enjoy Listen And Notes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      textAlign: TextAlign.center,
                      "Dengan pendekatan ini, Anda bisa membuat splash screen dengan animasi dan transisi ke halaman berikutnya menggunakan hanya widget dan fitur bawaan Flutter, tanpa bergantung pada paket tambahan.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),
                    BasicButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ChoseModePage(),
                          ),
                        );
                      },
                      title: 'Get Started',
                      height: 60,
                    ),
                  ],
                ),
              ),
              // Hapus atau komentari container ini sementara
              // Container(
              //   color: Colors.black.withOpacity(0.15),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
