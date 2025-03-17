import 'package:fixit_app/core/widgets/translate_button.dart';
import 'package:fixit_app/features/auth/presentation/widgets/SignUp_form.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/social_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Image.asset('assets/images/logo.png', height: 40),
        actions: [TranslateButton()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  S.of(context).enterYourEmailAndPasswordToLogin,
                  style: TextStyle(fontSize: 26),
                ),
                const SizedBox(height: 20),
                // Sign Up form
                SignUpForm(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).alreadyHaveAnAccount,
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).signInNow,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff0054A5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      S.of(context).or,
                      style: TextStyle(color: Colors.black),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      title: S.of(context).facebook,
                      iconColor: Colors.blue,
                      color: Colors.transparent,
                      icon: FontAwesomeIcons.facebook,
                      borderColor: Colors.grey,
                      onTap: () {},
                    ),
                    const SizedBox(width: 20),
                    SocialButton(
                      title: S.of(context).google,
                      iconColor: Colors.blue,
                      color: Colors.transparent,
                      icon: FontAwesomeIcons.google,
                      borderColor: Colors.grey,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
