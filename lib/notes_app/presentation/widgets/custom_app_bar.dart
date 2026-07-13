import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/custom_dialog.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/managers/cubit/box_type/box_type_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/delete_note/delete_note_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/move_note/move_note_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/note_selection/note_selection_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/note_selection/note_selection_state.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/theme_cubit/theme_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/view_cubit/view_cubit.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteSelectionCubit, NoteSelectionState>(
      builder: (context, selectionState) {
        final isSelectionMode = selectionState.isSelectionMode;
        final isPrivateMode = context.select(
          (BoxTypeCubit cubit) => cubit.state.isPrivateMode,
        );

        return SliverAppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          floating: true,
          snap: true,
          elevation: 0,
          centerTitle: false,

          leading: isSelectionMode
              ? IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () {
                    context.read<NoteSelectionCubit>().clearSelection();
                  },
                )
              : null,

          title: Text(
            isSelectionMode
                ? "${selectionState.selectedNoteKeys.length}"
                : (isPrivateMode ? "Private Notes" : S.of(context).myNotes),
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: Theme.of(context).appBarTheme.iconTheme?.color,
              letterSpacing: 0.5,
            ),
          ),

          actions: isSelectionMode
              ? [
                  IconButton(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      size: 26,
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                    onPressed: () {
                      CustomDialog.showSelectionMenuOptions(
                        context: context,
                        onDeleteTap: () {
                          final selectedKeys = selectionState.selectedNoteKeys;
                          final notesState = context.read<NotesCubit>().state;

                          if (notesState is NotesSuccess) {
                            context.read<DeleteNoteCubit>().deleteMultipleNotes(
                              keysToDelete: selectedKeys,
                              boxNameType: context
                                  .read<BoxTypeCubit>()
                                  .state
                                  .boxName,
                            );
                          }
                          context.read<NoteSelectionCubit>().clearSelection();
                          context.read<NotesCubit>().fetchAllNotes(
                            boxNameType: context
                                .read<BoxTypeCubit>()
                                .state
                                .boxName,
                          );
                        },
                        onMoveToPrivateTap: () {
                          final selectedKeys = selectionState.selectedNoteKeys;

                          final boxTypeCubit = context.read<BoxTypeCubit>();
                          final currentBoxName = boxTypeCubit.state.boxName;

                          context.read<MoveNoteCubit>().moveMultipleNotes(
                            keysToMove: selectedKeys,
                            boxTypeCubit: boxTypeCubit,
                          );

                          context.read<NoteSelectionCubit>().clearSelection();
                          context.read<NotesCubit>().fetchAllNotes(
                            boxNameType: currentBoxName,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                ]
              : [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_sharp,
                      size: 26,
                      color: Theme.of(context).appBarTheme.iconTheme?.color,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert_rounded, size: 26),
                    onPressed: () {
                      CustomDialog.showMenuOptions(
                        context: context,
                        isPrivateMode: context
                            .read<BoxTypeCubit>()
                            .state
                            .isPrivateMode,
                        onChangeTheme: () =>
                            context.read<ThemeCubit>().toggleTheme(),
                        onToggleView: () =>
                            context.read<ViewCubit>().toggleView(),
                        onLanguageTap: () =>
                            CustomDialog.showLanguagePicker(context: context),
                        onToggleNotesType: () {
                          context.read<BoxTypeCubit>().toggleBoxType();
                          context.read<NotesCubit>().fetchAllNotes(
                            boxNameType: context
                                .read<BoxTypeCubit>()
                                .state
                                .boxName,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                ],
        );
      },
    );
  }
}
