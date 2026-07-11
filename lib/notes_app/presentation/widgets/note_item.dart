import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/date_extension.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';
import 'package:to_do_app/notes_app/presentation/widgets/delete_button.dart';
class NoteItem extends StatelessWidget {
  final NoteModel noteModel;
  const NoteItem({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Color(noteModel.color);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      color: Theme.of(context).primaryColor,
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
                      style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Theme.of(context).textTheme.titleLarge?.color),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  DeleteButton(noteModel: noteModel), 
                ],
              ),
              const SizedBox(height: 8),
              Text(
                noteModel.subTitle,
                style: TextStyle(fontSize: 15, color:Theme.of(context).textTheme.titleMedium?.color, height: 1.4),
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

