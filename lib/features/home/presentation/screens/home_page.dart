import 'package:fixit_app/features/home/presentation/widgets/title_section.dart';
import 'package:fixit_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          width: 40,
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xff0054A5)),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Image.asset(
                'assets/images/banar.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            TitleSection(
              title: S.of(context).popularServices,
              subtitle: S.of(context).viewAll,
              onPressed: () {
                // Handle view all button press
              },
            ),
            SizedBox(height: 80),
            TitleSection(
              title: S.of(context).serviceProviders,
              subtitle: S.of(context).viewAll,
              onPressed: () {
                // Handle view all button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
