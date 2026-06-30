import 'package:flutter/material.dart';

class CustomNoteTextField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLines;
  final String hintText; 

  const CustomNoteTextField({
    super.key,
    required this.controller,
    this.maxLines,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFA07A).withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        textDirection: textDirection, 
        keyboardType: TextInputType.multiline,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black87,
          height: 1.4,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintTextDirection: textDirection,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}