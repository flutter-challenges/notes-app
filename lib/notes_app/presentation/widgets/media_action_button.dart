import 'package:flutter/material.dart';

class MediaActionWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  const MediaActionWidget({

    super.key, required this.icon, required this.color, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Icon(icon, color: color, size: 26),
      ),
    );
  }
}