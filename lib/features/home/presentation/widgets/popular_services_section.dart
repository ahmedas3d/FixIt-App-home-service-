import 'package:flutter/material.dart';

class Service {
  final String name;
  final String iconPath;

  Service({required this.name, required this.iconPath});
}

class PopularServicesSection extends StatelessWidget {
  PopularServicesSection({super.key});

  final List<Service> services = [
    Service(name: 'Plumbing', iconPath: 'assets/images/icon_app.png'),
    Service(name: 'Electrician', iconPath: 'assets/images/icon_app.png'),
    Service(name: 'Cleaning', iconPath: 'assets/images/icon_app.png'),
    Service(name: 'Painting', iconPath: 'assets/images/icon_app.png'),
    Service(name: 'Carpenter', iconPath: 'assets/images/icon_app.png'),
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
          return Container(
            width: screenWidth * 0.30,
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
                Image.asset(services[index].iconPath, width: 80, height: 80),
                const SizedBox(height: 8),
                Text(
                  services[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
