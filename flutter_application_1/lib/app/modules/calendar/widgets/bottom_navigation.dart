import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem('assets/images/home.png'),
          _buildNavItem('assets/images/search.png'),
          _buildNavItem('assets/images/plus-square.png'),
          _buildNavItem('assets/images/calendar-range.png'),
          _buildNavItem('assets/images/user.png'),
        ],
      ),
    );
  }

  Widget _buildNavItem(String assetPath) {
    return Image.asset(
      assetPath,
      width: 24,
      height: 24,
      fit: BoxFit.contain,
    );
  }
}
