import 'package:fixit_app/features/ServiceSection/presentation/widgets/custom_section.dart';
import 'package:flutter/widgets.dart';

class OtherServices extends StatelessWidget {
  const OtherServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomSection(
        services: [
          Services(name: "Dish Wash", iconPath: 'assets/icons/dish_wash.png'),
          Services(name: "Loading", iconPath: 'assets/icons/loading.png'),
          Services(name: "Cutting Grass", iconPath: 'assets/icons/cutting.png'),
          Services(
            name: "Yr Conditioner",
            iconPath: 'assets/icons/air_conditenior.jpg',
          ),
        ],
      ),
    );
  }
}
