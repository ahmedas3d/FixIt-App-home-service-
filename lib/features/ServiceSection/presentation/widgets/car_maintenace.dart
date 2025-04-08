import 'package:fixit_app/features/ServiceSection/presentation/widgets/custom_section.dart';
import 'package:flutter/widgets.dart';

class CarMaintenance extends StatelessWidget {
  const CarMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomSection(
        services: [
          Services(name: "Car Washer", iconPath: 'assets/icons/car_washer.png'),
          Services(name: "Oil Change", iconPath: 'assets/icons/oil_change.png'),
          Services(
            name: "Car Battery",
            iconPath: 'assets/icons/car_battery.png',
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
