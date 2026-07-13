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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
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
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                    height: 1.4,
                  ),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          cancelButtonText,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          confirmText,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
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
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.language_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  S.of(context).selectLanguage,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                _buildLanguageItem(
                  dialogContext,
                  'ar',
                  'العربية',
                  '🇪🇬',
                  currentLocale,
                ),
                Divider(height: 1, color: Theme.of(context).primaryColor),
                _buildLanguageItem(
                  dialogContext,
                  'en',
                  'English',
                  '🇺🇸',
                  currentLocale,
                ),
                Divider(height: 1, color: Theme.of(context).primaryColor),
                _buildLanguageItem(
                  dialogContext,
                  'fr',
                  'Français',
                  '🇫🇷',
                  currentLocale,
                ),
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
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle_rounded,
                size: 20,
                color: Theme.of(context).primaryColor,
              ),
          ],
        ),
      ),
    );
  }

  static void showMenuOptions({
    required BuildContext context,
    required bool isPrivateMode, 
    required VoidCallback onChangeTheme,
    required VoidCallback onToggleView,
    required VoidCallback onLanguageTap,
    required VoidCallback onToggleNotesType, 
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withOpacity(0.15),
      transitionDuration: const Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        final Color iconColor = Colors.white;

        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              constraints: const BoxConstraints(minWidth: 64, maxWidth: 74),
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildMenuItem(
                    icon: Icons.palette_outlined,
                    color: iconColor,
                    onTap: () {
                      Navigator.pop(context);
                      onChangeTheme();
                    },
                  ),
                  const PopupMenuDivider(height: 1),
                  _buildMenuItem(
                    icon: Icons.dashboard_customize_outlined,
                    color: iconColor,
                    onTap: () {
                      Navigator.pop(context);
                      onToggleView();
                    },
                  ),
                  const PopupMenuDivider(height: 1),
                  _buildMenuItem(
                    icon: Icons.language,
                    color: iconColor,
                    onTap: () {
                      Navigator.pop(context);
                      onLanguageTap();
                    },
                  ),
                  const PopupMenuDivider(height: 1),
                  
                  _buildMenuItem(
                    icon: isPrivateMode ? Icons.public_rounded : Icons.lock_outline_rounded,
                    color: iconColor,
                    onTap: () {
                      Navigator.pop(context);
                      onToggleNotesType(); 
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildMenuItem({
    required IconData icon,
    required Color? color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 52,
        alignment: Alignment.center,
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }

  static void showSelectionMenuOptions({
    required BuildContext context,
    required VoidCallback onDeleteTap,
    required VoidCallback onMoveToPrivateTap,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'DismissSelectionMenu',
      barrierColor: Colors.black.withOpacity(0.2),
      transitionDuration: const Duration(milliseconds: 180),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        final Color? iconColor = Theme.of(context).appBarTheme.iconTheme?.color;
        final Color? textColor = Theme.of(context).textTheme.bodyLarge?.color;

        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              constraints: const BoxConstraints(maxWidth: 280),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSelectionMenuItem(
                    context: context,
                    icon: Icons.delete_outline_rounded,
                    title: S.of(context).delete,
                    iconColor: iconColor,
                    textColor: Theme.of(context).textTheme.titleLarge?.color,
                    onTap: () {
                      Navigator.pop(context);
                      onDeleteTap();
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                  _buildSelectionMenuItem(
                    context: context,
                    icon: Icons.lock_outline_rounded,
                    title: 'Move to Private',
                    iconColor: iconColor,
                    textColor: Theme.of(context).textTheme.titleLarge?.color,
                    onTap: () {
                      Navigator.pop(context);
                      onMoveToPrivateTap();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildSelectionMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Color? iconColor,
    required Color? textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 14),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
