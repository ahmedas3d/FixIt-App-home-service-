import 'package:fixit_app/features/auth/presentation/widgets/SignIn_form.dart';
import 'package:fixit_app/features/auth/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset('assets/images/logo.png', height: 40),
        actions: [
          IconButton(
            icon: Icon(Icons.language, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Enter your email and password to login',
                style: TextStyle(fontSize: 26),
              ),
              const SizedBox(height: 20),
              // Sign in form
              SignInForm(),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to fixIt?', style: TextStyle(fontSize: 18)),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign Up Now',
                      style: TextStyle(fontSize: 18, color: Color(0xff0054A5)),
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
                  Text("Or", style: TextStyle(color: Colors.black)),
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
                    title: 'Facebook',
                    iconColor: Colors.blue,
                    color: Colors.transparent,
                    icon: FontAwesomeIcons.facebook,
                    borderColor: Colors.grey,
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    title: 'Google',
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
    );
  }
}
