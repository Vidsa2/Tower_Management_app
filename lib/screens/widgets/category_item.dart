// File: lib/widgets/category_item.dart
// (Or lib/screens/adminpanel/widgets/category_item.dart if you prefer to keep it local to adminpanel)

import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData iconData; // Using IconData as per Figma and previous code
  final Color backgroundColor;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Used for tap detection
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60, // Fixed width for the circle
            height: 60, // Fixed height for the circle
            decoration: BoxDecoration(
              color: backgroundColor, // Background color for the circle
              shape: BoxShape.circle, // Makes it a perfect circle
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1), // Subtle shadow
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              iconData,
              size: 30,
              color: Colors.grey[700],
            ), // Icon inside the circle
          ),
          const SizedBox(height: 8.0), // Space between circle and text
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
