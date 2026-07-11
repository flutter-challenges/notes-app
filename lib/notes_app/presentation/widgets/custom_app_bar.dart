import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/custom_dialog.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/managers/cubit/theme_cubit/theme_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/view_cubit/view_cubit.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_pop_menu_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      floating: true,
      snap: true,
      elevation: 0,
      centerTitle: false,
      title: Text(
        S.of(context).myNotes,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 26,
          color: Theme.of(context).appBarTheme.iconTheme?.color,
          letterSpacing: 0.5,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_sharp,
            size: 26,
            color: Theme.of(context).appBarTheme.iconTheme?.color,
          ),
        ),

        // const CustomPopupMenuButton(),
        IconButton(
          icon: const Icon(Icons.more_vert_rounded, size: 26),
          onPressed: () {
            CustomDialog.showMenuOptions(
              context: context,
              onChangeTheme: () => context.read<ThemeCubit>().toggleTheme(),
              onToggleView: () => context.read<ViewCubit>().toggleView(),
              onLanguageTap: () =>
                  CustomDialog.showLanguagePicker(context: context),
            );
          },
        ),

        SizedBox(width: 8),
      ],
    );
  }
}
