import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/notes_app/managers/cubit/locale_cubit/locale_cubit.dart';

class LanguagePickerDialog extends StatelessWidget {
  const LanguagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode;

    return AlertDialog(
      title: const Text(
        'Select Language / اختر اللغة',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xFFFFEBDC), 
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLanguageItem(context, 'ar', 'العربية', '🇪🇬', currentLocale),
          const Divider(),
          _buildLanguageItem(context, 'en', 'English', '🇺🇸', currentLocale),
          const Divider(),
          _buildLanguageItem(context, 'fr', 'Français', '🇫🇷', currentLocale),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(
    BuildContext context,
    String code,
    String name,
    String flag,
    String currentLocale,
  ) {
    final bool isSelected = currentLocale == code;

    return InkWell(
      onTap: () {
        context.read<LocaleCubit>().changeLanguage(code);
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
      ),
    );
  }
}