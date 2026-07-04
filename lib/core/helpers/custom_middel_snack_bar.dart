import 'package:flutter/material.dart';

enum MiddleSnackBarType { success, error }

class CustomMiddleSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    required MiddleSnackBarType type,
  }) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    ScaffoldMessenger.of(context).clearSnackBars();

    const Color themeColor = Colors.orange;

    final IconData iconData = switch (type) {
      MiddleSnackBarType.success => Icons.check_circle_rounded,
      MiddleSnackBarType.error => Icons.error_outline_rounded,
    };

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin: EdgeInsets.only(
          bottom: keyboardHeight > 0 
              ? keyboardHeight + 24 
              : (screenHeight * 0.35),
          left: screenWidth * 0.08,
          right: screenWidth * 0.08,
        ),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: themeColor, size: 30),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}