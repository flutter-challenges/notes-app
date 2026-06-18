import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final Color cardColor;

  const NoteItem({super.key, required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  "Flutter Tips",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blackDE,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                constraints: const BoxConstraints(), 
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.delete_outline, color: Colors.black54, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Expanded(
            child: Text(
              "Build your career step by step and keep learning every day.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black45,
                height: 1.3,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "June 18",
              style: TextStyle(
                fontSize: 11,
                color: Colors.black.withOpacity(0.4),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Colors {
  static const Color blackDE = Color(0xDE000000);
  static const Color black54 = Color(0x8A000000);
  static const Color black45 = Color(0x73000000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static final _Amber amber = _Amber();
}
class _Amber { final Color shade700 = const Color(0xFFF57C00); }