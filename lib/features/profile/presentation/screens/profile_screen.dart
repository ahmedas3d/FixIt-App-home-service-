import 'package:fixit_app/core/constants/constants.dart';
import 'package:fixit_app/features/profile/presentation/widgets/logout_row.dart';
import 'package:fixit_app/features/profile/presentation/widgets/name_iamge_profile.dart';
import 'package:fixit_app/features/profile/presentation/widgets/row_setting.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          S.of(context).myprofile,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColor.kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(
              width: double.infinity,
              height: 120.h,
              child: const NameAndImageProfile(),
            ),
            RowSetting(
              title: S.of(context).editProfile,
              icon: FontAwesomeIcons.penToSquare,
              onTap: () {},
            ),
            RowSetting(
              title: S.of(context).notification,
              icon: FontAwesomeIcons.bell,
              onTap: () {},
            ),
            RowSetting(
              title: S.of(context).paymentMethod,
              icon: FontAwesomeIcons.moneyBill,
              onTap: () {},
            ),
            RowSetting(
              title: S.of(context).helpSupport,
              icon: FontAwesomeIcons.headset,
              onTap: () {},
            ),
            LogoutRow(
              title: S.of(context).logout,
              icon: FontAwesomeIcons.arrowRightFromBracket,
            ),
          ],
        ),
      ),
    );
  }
}
