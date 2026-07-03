import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/custom_middel_snack_bar.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/add_note_bloc/add_note_bloc.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_button.dart';
import 'add_note_body.dart';

class AddNoteForm extends StatefulWidget {
  final AddNoteState state;
  const AddNoteForm({super.key, required this.state});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _desController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _desController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _desController.dispose();
    super.dispose();
  }

  void _validateAndSave() {
    final String title = _titleController.text.trim();
    final String description = _desController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      if (title.isEmpty && description.isEmpty) {
          CustomMiddleSnackBar.show( message: S.of(context).errorEmptyTitleAndDesc, context ,type: MiddleSnackBarType.error);
      } else if (title.isEmpty) {
        CustomMiddleSnackBar.show( message: S.of(context).errorEmptyTitle, context ,type: MiddleSnackBarType.error);
      } else {
        CustomMiddleSnackBar.show( message: S.of(context).errorEmptyDesc, context ,type: MiddleSnackBarType.error);
      }
      return;
    }

    final note = NoteModel(
      title: title,
      subTitle: description,
      date: DateTime.now(),
      color: NoteModel.noteColors[2].toARGB32(),
    );

    context.read<AddNoteBloc>().add(AddNoteSubmittedEvent(note));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AddNoteBody(
            titleController: _titleController,
            desController: _desController,
          ),
        ),
        CustomButton(
          state: widget.state,
          onPressed: _validateAndSave,
        ),
      ],
    );
  }
}