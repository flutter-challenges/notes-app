import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/managers/cubit/locale_cubit/locale_cubit.dart';

class CustomDialog {
  
  static void showConfirmation({
    required BuildContext context,
    String title = '',
    required String content,
    required String confirmText,
    required VoidCallback onConfirm,
    Color confirmButtonColor = Colors.orange,
    IconData topIcon = Icons.delete_sweep_rounded,
  }) {
    final String cancelButtonText = S.of(context).cancel;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 10,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: confirmButtonColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(topIcon, color: confirmButtonColor, size: 36),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  content,
                  style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.6), height: 1.4),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(cancelButtonText, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          onConfirm();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: confirmButtonColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(confirmText, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showLanguagePicker({required BuildContext context}) {
    final currentLocale = Localizations.localeOf(context).languageCode;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 10,
          backgroundColor:Theme.of(context).scaffoldBackgroundColor, 
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color:Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.language_rounded, color: Theme.of(context).primaryColor, size: 36),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).selectLanguage,
                  style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Theme.of( context).textTheme.bodyLarge?.color),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                
                _buildLanguageItem(dialogContext, 'ar', 'العربية', '🇪🇬', currentLocale),
                 Divider(height: 1, color:Theme.of(context).primaryColor),
                _buildLanguageItem(dialogContext, 'en', 'English', '🇺🇸', currentLocale),
                 Divider(height: 1, color:Theme.of(context).primaryColor),
                _buildLanguageItem(dialogContext, 'fr', 'Français', '🇫🇷', currentLocale),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildLanguageItem(
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
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        child: Row(
          children: [
            Text(flag, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 14),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(Icons.check_circle_rounded, size: 20, color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}