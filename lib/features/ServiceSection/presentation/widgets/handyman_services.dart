import 'package:fixit_app/features/ServiceSection/presentation/widgets/custom_section.dart';
import 'package:flutter/widgets.dart';

class HandymanServices extends StatelessWidget {
  const HandymanServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomSection(
        services: [
          Services(name: "Furniture", iconPath: 'assets/icons/furnture.png'),
          Services(name: "Oil Change", iconPath: 'assets/icons/oil_change.png'),
          Services(name: "Door Repair", iconPath: 'assets/icons/door.png'),
          Services(
            name: "Yr Conditioner",
            iconPath: 'assets/icons/air_conditenior.jpg',
          ),
        ],
      ),
    );
  }
}
