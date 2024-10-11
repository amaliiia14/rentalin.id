import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align to start
        children: [
          const SizedBox(width: 12), // Optional spacing, can be adjusted or removed
        ],
      ),
    );
  }
}
