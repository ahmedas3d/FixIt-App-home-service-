import 'package:fixit_app/features/ServiceSection/presentation/widgets/custom_section.dart';
import 'package:flutter/widgets.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomSection(
        services: [
          Services(name: "Cameras", iconPath: 'assets/icons/cameras.png'),
          Services(
            name: "Burglar Alarm",
            iconPath: 'assets/icons/burglar_alarm.png',
          ),
          Services(
            name: "Sturdy Locks",
            iconPath: 'assets/icons/sturdy_lock.png',
          ),
          Services(
            name: "Yr Conditioner",
            iconPath: 'assets/icons/air_conditenior.jpg',
          ),
        ],
      ),
    );
  }
}
