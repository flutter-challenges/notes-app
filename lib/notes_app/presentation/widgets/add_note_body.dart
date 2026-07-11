import 'package:flutter/material.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_note_text_field.dart';

class AddNoteBody extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController desController;

  const AddNoteBody({
    super.key,
    required this.titleController,
    required this.desController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomNoteTextField(
                  controller: titleController,
                  hintText: S.of(context).noteTitleHint,
                ),
                const SizedBox(height: 16),

                CustomNoteTextField(
                  controller: desController,
                  maxLines: 20,
                  hintText: S.of(context).noteDetailsHint,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
