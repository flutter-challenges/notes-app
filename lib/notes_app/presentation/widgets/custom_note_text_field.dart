import 'package:flutter/material.dart';

class CustomNoteTextField extends StatefulWidget {
  final TextEditingController controller;
  final int? maxLines;
  final String hintAr;
  final String hintEn;

  const CustomNoteTextField({
    super.key,
    required this.controller,
    this.maxLines,
    required this.hintAr,
    required this.hintEn,
  });

  @override
  State<CustomNoteTextField> createState() => _CustomNoteTextFieldState();
}

class _CustomNoteTextFieldState extends State<CustomNoteTextField> {
  bool isArabic = true;

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              maxLines: widget.maxLines,
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              keyboardType: TextInputType.multiline,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black87,
                height: 1.4,
              ),
              decoration: InputDecoration(
                hintText: isArabic ? widget.hintAr : widget.hintEn,
                hintTextDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 15),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isArabic = !isArabic;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: isArabic
                      ? const Color.fromARGB(255, 255, 219, 196)
                      : Colors.amber.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isArabic ? "العربية" : "English",
                  style: TextStyle(
                    color: isArabic ? Colors.brown.shade900 : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}