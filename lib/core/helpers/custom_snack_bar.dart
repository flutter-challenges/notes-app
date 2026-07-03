import 'package:flutter/material.dart';

enum SnackBarType { success, error, warning, info }

class CustomSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    required SnackBarType type,
    Duration duration = const Duration(milliseconds: 2000),
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final (backgroundColor, icon) = switch (type) {
      SnackBarType.success => (
          Colors.red.shade800,
          const Icon(Icons.check_circle_rounded, color: Colors.white, size: 22)
        ),
      SnackBarType.error => (
          Colors.red.shade800,
          const Icon(Icons.error_rounded, color: Colors.white, size: 22)
        ),
      SnackBarType.warning => (
          Colors.amber.shade900,
          const Icon(Icons.warning_rounded, color: Colors.white, size: 22)
        ),
      SnackBarType.info => (
          Colors.blue.shade800,
          const Icon(Icons.info_rounded, color: Colors.white, size: 22)
        ),
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            icon,
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        duration: duration,
        margin: const EdgeInsets.all(16), 
      ),
    );
  }
}