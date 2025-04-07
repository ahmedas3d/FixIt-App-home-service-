import 'package:flutter/material.dart';

class Service {
  final String name;
  final String iconPath;
  final VoidCallback? onPressed;

  Service({required this.name, required this.iconPath, this.onPressed});
}

class PopularServicesSection extends StatelessWidget {
  PopularServicesSection({super.key});

  final List<Service> services = [
    Service(
      name: 'Plumbing',
      iconPath: 'assets/icons/plumber.png',
      onPressed: () {},
    ),
    Service(
      name: 'Electrician',
      iconPath: 'assets/icons/multimeter.png',
      onPressed: () {},
    ),
    Service(
      name: 'Cleaning',
      iconPath: 'assets/icons/cleaning.png',
      onPressed: () {},
    ),
    Service(
      name: 'Painting',
      iconPath: 'assets/icons/painter.png',
      onPressed: () {},
    ),
    Service(
      name: 'Air Conditioning',
      iconPath: 'assets/icons/air_conditenior.png',
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: services[index].onPressed,
            child: Container(
              width: screenWidth * 0.28,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!, width: 1.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    services[index].iconPath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    services[index].name,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
