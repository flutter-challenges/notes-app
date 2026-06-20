import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/presentation/widgets/edit_and_show_note_body.dart';

class EditAndShowNoteView extends StatelessWidget {
  final NoteModel noteModel;
  const EditAndShowNoteView({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: EditAndShowNoteBody(noteModel: noteModel),
    );
  }
}