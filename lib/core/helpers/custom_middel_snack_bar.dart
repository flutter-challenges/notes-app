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

    // تصفير أي سناب بار معروض لمنع التراكم
    ScaffoldMessenger.of(context).clearSnackBars();

    // اللون المفضل الممرر للتطبيق (الأساسي)
    const Color primaryColor = Color(0xFFFFCCBC);
    // لون برتقالي أغمق قليلاً للنصوص والأيقونات في حالة النجاح لضمان وضوح القراءة
    final Color successAccent = primaryColor; 

    // تحديد الأيقونة ولون الحواف والخط بناءً على نوع الـ SnackBar
    final (icon, borderColor, textColor) = switch (type) {
      MiddleSnackBarType.success => (
          Icon(Icons.check_circle_rounded, color: successAccent, size: 30),
          primaryColor, // حواف بلون الخوخ الفاتح
          successAccent,
        ),
      MiddleSnackBarType.error => (
          const Icon(Icons.error_outline_rounded, color: primaryColor, size: 30),
          primaryColor, // حواف حمراء خفيفة
          primaryColor,
        ),
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
            // خلفية بيضاء ناصعة بدلاً من الأسود
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            // تحديد لون الحواف بناءً على نوع التنبيه لجعل الشكل جمالي
            border: Border.all(color: borderColor, width: 2.3),
            boxShadow: [
              BoxShadow(
                // ظل ناعم ورمادي خفيف جداً ليظهر الكارد كأنه طائر فوق الواجهة
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor, // لون النص يتغير حسب نجاح أو فشل التنبيه
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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