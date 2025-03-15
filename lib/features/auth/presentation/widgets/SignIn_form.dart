import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_button.dart';
import 'custom_password_from_field.dart';
import 'custom_text_form_field.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  final GlobalKey<FormState> formSignInKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formSignInKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTextField(
            controller: emailController,
            label: 'Email',
            hint: 'Enter your email',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 15),
          CustomPasswordField(
            controller: passwordController,
            label: 'Password',
            hint: 'Enter your password',
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: Text(
              'Forgot password?',
              style: TextStyle(color: Color(0xff0054A5), fontSize: 16),
            ),
          ),
          const SizedBox(height: 15),
          customButton(
            color: Color(0xff0054A5),
            textColor: Colors.white,
            title: 'Sign In',
            onTap: () {
              if (formSignInKey.currentState?.validate() ?? false) {}
            },
            size: 60,
            textSize: 18,
          ),
        ],
      ),
    );
  }
}
