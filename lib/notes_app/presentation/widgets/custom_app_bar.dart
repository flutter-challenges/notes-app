import 'package:flutter/material.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_pop_menu_button.dart';
import 'package:to_do_app/notes_app/presentation/widgets/language_picker_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xFFFFEBDC), 
      floating: true,
      snap: true, 
      elevation: 0,
      centerTitle: false,
      title: Text(
        S.of(context).myNotes,
        style: const TextStyle(
          fontWeight: FontWeight.w800, 
          fontSize: 26,
          color: Color(0xFF2C1B1B), 
          letterSpacing: 0.5,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_sharp, size: 26, color: Colors.black87),
        ),
        
        const LanguagePickerButton(),
        
        const CustomPopupMenuButton(),
        
        const SizedBox(width: 8),
      ],
    );
  }
}