import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add your home screen content here
          ],
        ),
      ),
    );
  }
}
