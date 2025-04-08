import 'package:fixit_app/features/ServiceSection/presentation/widgets/custom_section.dart';
import 'package:flutter/widgets.dart';

class HomeImprovement extends StatelessWidget {
  const HomeImprovement({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomSection(
        services: [
          Services(name: "Drilling", iconPath: 'assets/icons/drilling.png'),
          Services(name: "Lawn", iconPath: 'assets/icons/lawn.png'),
          Services(
            name: "Weed Control",
            iconPath: 'assets/icons/weed_control.png',
          ),
          Services(
            name: "Pir Conditioner",
            iconPath: 'assets/icons/air_conditenior.jpg',
          ),
        ],
      ),
    );
  }
}
