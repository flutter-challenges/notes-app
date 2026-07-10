import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/presentation/widgets/language_picker_button.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.more_vert_rounded,
        size: 26,
        color: Colors.black87,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFFFFEBDC),
      elevation: 3,
      constraints: const BoxConstraints(minWidth: 64, maxWidth: 74),
      onSelected: (value) {
        switch (value) {
          case 'change_theme':
            break;
          case 'toggle_view':
            break;
          case 'language_picker':
             showDialog(
              context: context,
              builder: (context) => const LanguagePickerDialog(),
            );
            break;
        }
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'change_theme',
          child: Center(
            child: Icon(
              Icons.palette_outlined,
              color: Colors.black87,
              size: 24,
            ),
          ),
        ),
        const PopupMenuDivider(height: 1),
        const PopupMenuItem<String>(
          value: 'toggle_view',
          child: Center(
            child: Icon(
              Icons.dashboard_customize_outlined,
              color: Colors.black87,
              size: 24,
            ),
          ),
        ),
        const PopupMenuDivider(height: 1),
        const PopupMenuItem<String>(
          value: 'language_picker',
          child: Center(
            child: Icon(Icons.language, color: Colors.black87, size: 24),
          ),
        ),
      ],
    );
  }
}
