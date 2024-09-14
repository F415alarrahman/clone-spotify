import 'package:enjoyy/common/widget/appbar/app_bar.dart';
import 'package:enjoyy/common/widget/button/basic_button.dart';
import 'package:enjoyy/core/utils/assets_path.dart';
import 'package:enjoyy/module/auth/sign_up_page.dart.dart';
import 'package:enjoyy/module/auth/signin_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SigninNotifier(context),
      child: Consumer<SigninNotifier>(
        builder: (context, value, child) => Scaffold(
          appBar: BasicAppBar(title: _signinText()),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _signinText(),
                SizedBox(
                  height: 16,
                ),
                Image.asset(
                  ImageAssets.spotify,
                  height: 128,
                  width: 128,
                ),
                SizedBox(
                  height: 16,
                ),
                _email(context),
                SizedBox(
                  height: 16,
                ),
                _password(context),
                SizedBox(
                  height: 32,
                ),
                BasicButton(
                  onPressed: () {},
                  title: 'Sign In',
                ),
                SizedBox(
                  height: 16,
                ),
                _signupText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      "Sign In",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  Widget _email(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: 'Email')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _password(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: 'Password')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Do You Have An Account?",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const SignUpPage()),
            );
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
