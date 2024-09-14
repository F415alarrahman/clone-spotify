import 'package:enjoyy/common/widget/appbar/app_bar.dart';
import 'package:enjoyy/common/widget/button/basic_button.dart';
import 'package:enjoyy/core/utils/assets_path.dart';
import 'package:enjoyy/module/auth/sign_up_notifier.dart';
import 'package:enjoyy/module/auth/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpNotifier(context: context),
      child: Consumer<SignUpNotifier>(
        builder: (context, value, child) => Scaffold(
          appBar: BasicAppBar(
            title: Image.asset(
              ImageAssets.spotify,
              height: 50,
              width: 50,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _registerText(),
                SizedBox(
                  height: 16,
                ),
                _fullName(context),
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
                  title: 'Create Account',
                ),
                SizedBox(
                  height: 16,
                ),
                _signinText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      "Register",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullName(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: 'Full Name')
          .applyDefaults(Theme.of(context).inputDecorationTheme),
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

  Widget _signinText(BuildContext context) {
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
                  builder: (BuildContext context) => const SigninPage()),
            );
          },
          child: Text(
            'Sign In',
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
