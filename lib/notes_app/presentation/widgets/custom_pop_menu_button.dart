import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/custom_dialog.dart';
import 'package:to_do_app/notes_app/managers/cubit/theme_cubit/theme_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/view_cubit/view_cubit.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon:  Icon(
        Icons.more_vert_rounded,
        size: 26,
        color:Theme.of(context).appBarTheme.iconTheme?.color,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 3,
      constraints: const BoxConstraints(minWidth: 64, maxWidth: 74),
      onSelected: (value) {
        switch (value) {
          case 'change_theme':
            context.read<ThemeCubit>().toggleTheme();
            break;
          case 'toggle_view':
            context.read<ViewCubit>().toggleView();
            break;
          case 'language_picker':
            CustomDialog.showLanguagePicker(context: context);
            break;
        }
      },
      itemBuilder: (BuildContext context) => [
         PopupMenuItem<String>(
          value: 'change_theme',
          child: Center(
            child: Icon(
              Icons.palette_outlined,
              color: Theme.of(context).appBarTheme.iconTheme?.color,
              size: 24,
            ),
          ),
        ),
        const PopupMenuDivider(height: 1),
         PopupMenuItem<String>(
          value: 'toggle_view',
          child: Center(
            child: Icon(
              Icons.dashboard_customize_outlined,
              color: Theme.of(context).appBarTheme.iconTheme?.color,
              size: 24,
            ),
          ),
        ),
        const PopupMenuDivider(height: 1),
         PopupMenuItem<String>(
          value: 'language_picker',
          child: Center(
            child: Icon(Icons.language, color: Theme.of(context).appBarTheme.iconTheme?.color, size: 24),
          ),
        ),
      ],
    );
  }
}
