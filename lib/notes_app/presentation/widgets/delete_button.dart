import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/custom_dialog.dart';
import 'package:to_do_app/core/helpers/custom_snack_bar.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/delete_note/delete_note_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';

class DeleteButton extends StatelessWidget {
  final NoteModel noteModel;
  const DeleteButton({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteNoteCubit, DeleteNoteState>(
      listener: (context, state) {
        if (state is DeleteNoteSuccess) {
          context.read<NotesCubit>().fetchAllNotes();
          CustomSnackBar.show(context, message: S.of(context).NoteDeletedSuccessfully, type: SnackBarType.success);
        }
      },
      builder: (context, state) {
        return Transform.translate(
          offset: const Offset(6, -6),
          child: IconButton(
            onPressed: state is DeleteNoteLoading 
                ? null 
                : () => CustomDialog.showConfirmation( 
                    context: context,
                    title: S.of(context).deleteNote,
                    content: S.of(context).deleteNoteConfirmation,
                    confirmText: S.of(context).delete,
                    onConfirm: () => context.read<DeleteNoteCubit>().deleteNote(note: noteModel),
                  ),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(6),
            icon: switch (state) {
              DeleteNoteLoading() => const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black54),
                ),
              _ => Icon(Icons.delete_outline_rounded, color: Colors.black.withOpacity(0.55), size: 24),
            },
          ),
        );
      },
    );
  }
}