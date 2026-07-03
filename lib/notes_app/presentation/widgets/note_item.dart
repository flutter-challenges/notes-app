import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/custom_dialog.dart';
import 'package:to_do_app/core/helpers/date_extension.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/core/helpers/custom_snack_bar.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/delete_note/delete_note_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';
class NoteItem extends StatelessWidget {
  final NoteModel noteModel;
  const NoteItem({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Color(noteModel.color);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      color: baseColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () => context.pushNamed(
          AppRoutes.editAndShowNoteView,
          argument: {'noteModel': noteModel, 'notesCubit': context.read<NotesCubit>()},
        ),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      noteModel.title,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _DeleteButton(noteModel: noteModel), 
                ],
              ),
              const SizedBox(height: 8),
              Text(
                noteModel.subTitle,
                style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.65), height: 1.4),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.access_time_rounded, size: 14, color: Colors.black.withOpacity(0.4)),
                  const SizedBox(width: 4),
                  Text(
                    noteModel.date.toFormattedString(context),
                    style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final NoteModel noteModel;
  const _DeleteButton({required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteNoteCubit, DeleteNoteState>(
      listener: (context, state) {
        if (state is DeleteNoteSuccess) {
          context.read<NotesCubit>().fetchAllNotes();
          CustomSnackBar.show(context, message: 'تم حذف الملاحظة بنجاح', type: SnackBarType.success);
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
                    title: 'حذف الملاحظة',
                    content: 'هل تريد حذف هذه الملاحظة؟',
                    confirmText: 'حذف',
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