import 'package:fixit_app/Models/rive_model.dart';
import 'package:fixit_app/core/widgets/BottomNavBar/animated_icon_items.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xff0054A5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(bottomNavItems.length, (index) {
            return GestureDetector(
              onTap: () => onTabChange(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == index
                              ? Colors.white
                              : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  AnimatedIconItems(
                    riveModel: bottomNavItems[index],
                    isActive: selectedIndex == index,
                  ),
                  Text(
                    bottomNavItems[index].title(context), // اسم العنصر
                    style: TextStyle(
                      color:
                          selectedIndex == index
                              ? Colors.white
                              : Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
