import 'package:flutter/material.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/presentation/widgets/language_picker_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 255, 219, 196),
      floating: true,
      elevation: 0,
      title: Text(
        S.of(context).myNotes,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black87,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_sharp, size: 28, color: Colors.black87),
        ),
        const LanguagePickerButton(), 
        const SizedBox(width: 8),
      ],
    );
  }
}