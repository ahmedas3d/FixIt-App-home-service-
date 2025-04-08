import 'package:fixit_app/features/ServiceSection/presentation/widgets/custom_section.dart';
import 'package:flutter/widgets.dart';

class Cleaning extends StatelessWidget {
  const Cleaning({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomSection(
        services: [
          Services(
            name: "Home Flooring",
            iconPath: 'assets/icons/home_floor.png',
          ),
          Services(name: "Gutter", iconPath: 'assets/icons/gutter.png'),
          Services(name: "Carpet", iconPath: 'assets/icons/carpet.png'),
          Services(
            name: "Or Conditioner",
            iconPath: 'assets/icons/air_conditenior.jpg',
          ),
        ],
      ),
    );
  }
}
