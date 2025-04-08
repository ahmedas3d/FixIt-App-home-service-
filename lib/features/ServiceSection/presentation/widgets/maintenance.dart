import 'package:fixit_app/features/ServiceSection/presentation/widgets/custom_section.dart';
import 'package:flutter/widgets.dart';

class Maintenance extends StatelessWidget {
  const Maintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomSection(
        services: [
          Services(
            name: "Air Conditioner",
            iconPath: 'assets/icons/air_conditenior.jpg',
          ),
          Services(name: "Electric", iconPath: 'assets/icons/multimeter.png'),
          Services(
            name: "Siding Repair",
            iconPath: 'assets/icons/siding_repair.jpg',
          ),
          Services(
            name: "Kir Conditioner",
            iconPath: 'assets/icons/air_conditenior.jpg',
          ),
        ],
      ),
    );
  }
}
