import 'package:flutter/material.dart';
import 'package:to_do_app/core/helpers/date_extension.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_note_text_field.dart';

class EditAndShowNoteForm extends StatelessWidget {
  final NoteModel noteModel;
  final TextEditingController titleController;
  final TextEditingController desController;

  const EditAndShowNoteForm({
    super.key,
    required this.noteModel,
    required this.titleController,
    required this.desController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).lastEdit(noteModel.date.toFormattedString(context)),
            style: const TextStyle(color: Colors.black38, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          CustomNoteTextField(
            controller: titleController,
            hintText: S.of(context).noteTitleHint,
          ),
          const SizedBox(height: 16),
          CustomNoteTextField(
            controller: desController,
            maxLines: 25,
            hintText: S.of(context).noteDetailsHint,
          ),
        ],
      ),
    );
  }
}