import 'package:fixit_app/core/widgets/BottomNavBar/custom_bottom_nav_bar.dart';
import 'package:fixit_app/features/home/presentation/screens/home_page.dart';
import 'package:fixit_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // قائمة بالشاشات المرتبطة بكل أيقونة
  static final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('Search Screen')),
    const Center(child: Text('Favorites Screen')),
    const ProfileScreen(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
