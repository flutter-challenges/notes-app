import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/date_extension.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/note_selection/note_selection_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/note_selection/note_selection_state.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';
import 'package:to_do_app/notes_app/presentation/widgets/delete_button.dart';

class NoteItem extends StatelessWidget {
  final NoteModel noteModel;
  const NoteItem({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteSelectionCubit, NoteSelectionState>(
      builder: (context, selectionState) {
        final isSelected = selectionState.selectedNoteKeys.contains(noteModel.key);

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          color: isSelected 
              ? Theme.of(context).primaryColor.withOpacity(0.5) 
              : Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: isSelected 
                ? const BorderSide(color: Colors.amber, width: 2) 
                : BorderSide.none,
          ),
          child: InkWell(
            onLongPress: () {
              context.read<NoteSelectionCubit>().toggleSelection(noteModel.key);
            },
            onTap: () {
              if (selectionState.isSelectionMode) {
                context.read<NoteSelectionCubit>().toggleSelection(noteModel.key);
              } else {
                context.pushNamed(
                  AppRoutes.editAndShowNoteView,
                  argument: {
                    'noteModel': noteModel,
                    'notesCubit': context.read<NotesCubit>()
                  },
                );
              }
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              noteModel.title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.titleLarge?.color),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (!selectionState.isSelectionMode) 
                            DeleteButton(noteModel: noteModel),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        noteModel.subTitle,
                        style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).textTheme.titleMedium?.color,
                            height: 1.4),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.access_time_rounded,
                              size: 14, color: Colors.black.withOpacity(0.4)),
                          const SizedBox(width: 4),
                          Text(
                            noteModel.date.toFormattedString(context),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.4),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (isSelected)
                    const Positioned(
                      top: 0,
                      left: 0, 
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.amber,
                        child: Icon(Icons.check, size: 16, color: Colors.white),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}