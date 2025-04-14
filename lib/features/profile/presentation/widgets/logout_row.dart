import 'package:fixit_app/core/constants/constants.dart';
import 'package:fixit_app/core/services/auth_cubit/auth_cubit.dart';
import 'package:fixit_app/features/auth/presentation/screens/SignIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LogoutRow extends StatelessWidget {
  final String title;
  final IconData icon;
  const LogoutRow({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(icon, color: AppColor.kPrimaryColor),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            const Spacer(flex: 1),
            GestureDetector(
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.success,
                  title: "Logout",
                  desc: "Are you sure you want to logout?",
                  buttons: [
                    DialogButton(
                      onPressed: () => Navigator.pop(context),
                      color: Colors.red,
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    DialogButton(
                      onPressed: () async {
                        try {
                          await context.read<AuthCubit>().logout();
                          Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const SignInScreen(),
                              transitionsBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                            (route) => false,
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(116, 116, 191, 1.0),
                          Color.fromRGBO(52, 138, 199, 1.0),
                        ],
                      ),
                      child: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ).show();
              },
              child: Container(
                height: 35.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
