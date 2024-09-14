import 'package:enjoyy/common/widget/appbar/app_bar.dart';
import 'package:enjoyy/common/widget/button/basic_button.dart';
import 'package:enjoyy/module/auth/sign_up_page.dart.dart';
import 'package:enjoyy/module/auth/signin_page.dart';
import 'package:enjoyy/module/auth/signup_or_signin_notifier.dart';
import 'package:enjoyy/module/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.isDarkMode; // Ambil status mode gelap

    return ChangeNotifierProvider(
      create: (_) => SignupOrSigninNotifier(context),
      child: Consumer<SignupOrSigninNotifier>(
        builder: (context, value, child) => Scaffold(
          body: Stack(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BasicAppBar(),
                    const SizedBox(height: 60),
                    Text(
                      "Sign Up or Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDarkMode
                            ? Colors.white
                            : Colors.black, // Warna teks berdasarkan mode
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      "Dengan pendekatan ini, Anda bisa membuat splash screen dengan animasi dan transisi ke halaman berikutnya menggunakan hanya widget dan fitur bawaan Flutter, tanpa bergantung pada paket tambahan.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isDarkMode
                            ? Colors.grey[200]
                            : Colors.grey[800], // Warna teks berdasarkan mode
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: BasicButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignUpPage()));
                              },
                              title: "Sign Up",
                              height: 48,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SigninPage()));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors
                                          .black, // Warna teks berdasarkan mode
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
