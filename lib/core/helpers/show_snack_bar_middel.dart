import 'package:flutter/material.dart';

void showMiddleSnackBar(String message, BuildContext context) {
  final double screenHeight = MediaQuery.of(context).size.height;
  final double screenWidth = MediaQuery.of(context).size.width;
  final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
  ScaffoldMessenger.of(context).clearSnackBars();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E).withOpacity(0.95),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(Icons.warning_rounded, color: Colors.amber, size: 26),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                maxLines: 2,
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.only(
        bottom: keyboardHeight > 0
            ? keyboardHeight +
                  20 
            : (screenHeight *
                  0.35), 
        left: screenWidth * 0.08,
        right: screenWidth * 0.08,
      ),
    ),
  );
}
