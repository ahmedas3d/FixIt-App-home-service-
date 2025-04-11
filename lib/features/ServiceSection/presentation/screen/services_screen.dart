import 'package:fixit_app/core/constants/constants.dart';
import 'package:fixit_app/features/ServiceSection/presentation/widgets/car_maintenace.dart';
import 'package:fixit_app/features/ServiceSection/presentation/widgets/cleaning.dart';
import 'package:fixit_app/features/ServiceSection/presentation/widgets/handyman_services.dart';
import 'package:fixit_app/features/ServiceSection/presentation/widgets/home_improvement.dart';
import 'package:fixit_app/features/ServiceSection/presentation/widgets/maintenance.dart';
import 'package:fixit_app/features/ServiceSection/presentation/widgets/other_services.dart';
import 'package:fixit_app/features/ServiceSection/presentation/widgets/painting_services.dart';
import 'package:fixit_app/features/ServiceSection/presentation/widgets/security_widget.dart';
import 'package:fixit_app/features/home/presentation/widgets/title_section.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          S.of(context).popularServices,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        foregroundColor: AppColor.kPrimaryColor,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, bottom: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleSection(title: S.of(context).maintenance),
              const Maintenance(),
              TitleSection(title: S.of(context).cleaning),
              const Cleaning(),
              TitleSection(title: S.of(context).homeImprovement),
              const HomeImprovement(),
              TitleSection(title: S.of(context).security),
              const Security(),
              TitleSection(title: S.of(context).carMaintenance),
              const CarMaintenance(),
              TitleSection(title: S.of(context).handymanServices),
              const HandymanServices(),
              TitleSection(title: S.of(context).paintingServices),
              const PaintingServices(),
              TitleSection(title: S.of(context).otherServices),
              const OtherServices(),
            ],
          ),
        ),
      ),
    );
  }
}
