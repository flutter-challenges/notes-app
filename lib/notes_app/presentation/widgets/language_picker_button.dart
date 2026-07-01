import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/notes_app/managers/cubit/locale_cubit/locale_cubit.dart';

class LanguagePickerButton extends StatelessWidget {
  const LanguagePickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;

    return PopupMenuButton<String>(
      icon: const Icon(Icons.translate_rounded, size: 26, color: Colors.black87),
      tooltip: 'Change Language',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onSelected: (String languageCode) {
        context.read<LocaleCubit>().changeLanguage(languageCode);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        _buildLanguageItem('ar', 'العربية', '🇪🇬', currentLocale),
        _buildLanguageItem('en', 'English', '🇺🇸', currentLocale),
        _buildLanguageItem('fr', 'Français', '🇫🇷', currentLocale),
      ],
    );
  }

  PopupMenuItem<String> _buildLanguageItem(
    String code,
    String name,
    String flag,
    String currentLocale,
  ) {
    final bool isSelected = currentLocale == code;

    return PopupMenuItem<String>(
      value: code,
      child: Row(
        children: [
          Text(flag, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 12),
          Text(
            name,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.amber.shade800 : Colors.black87,
            ),
          ),
          const Spacer(),
          if (isSelected)
            Icon(Icons.check_circle, size: 18, color: Colors.amber.shade800),
        ],
      ),
    );
  }
}