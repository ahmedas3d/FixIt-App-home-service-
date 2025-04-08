import 'package:fixit_app/features/ServiceSection/presentation/widgets/custom_section.dart';
import 'package:flutter/widgets.dart';

class PaintingServices extends StatelessWidget {
  const PaintingServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomSection(
        services: [
          Services(
            name: "Interior Painting",
            iconPath: 'assets/icons/interior.png',
          ),
          Services(
            name: "exterior Painting",
            iconPath: 'assets/icons/exterior.png',
          ),
          Services(name: "Wall Painting", iconPath: 'assets/icons/wall.png'),
          Services(
            name: "Yr Conditioner",
            iconPath: 'assets/icons/air_conditenior.jpg',
          ),
        ],
      ),
    );
  }
}
