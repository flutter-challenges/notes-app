import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/update_note/update_note_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/update_note/update_note_state.dart';
import 'package:to_do_app/notes_app/presentation/widgets/edit_and_show_note_form.dart';

class EditAndShowNoteView extends StatefulWidget {
  final NoteModel noteModel;
  const EditAndShowNoteView({super.key, required this.noteModel});

  @override
  State<EditAndShowNoteView> createState() => _EditAndShowNoteViewState();
}

class _EditAndShowNoteViewState extends State<EditAndShowNoteView> {
  late final TextEditingController _titleController;
  late final TextEditingController _desController;
  late final ValueNotifier<bool> _hasChangesNotifier;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.noteModel.title);
    _desController = TextEditingController(text: widget.noteModel.subTitle);
    _hasChangesNotifier = ValueNotifier<bool>(false);

    _titleController.addListener(_checkForChanges);
    _desController.addListener(_checkForChanges);
  }

  @override
  void dispose() {
    _titleController.removeListener(_checkForChanges);
    _desController.removeListener(_checkForChanges);
    _titleController.dispose();
    _desController.dispose();
    _hasChangesNotifier.dispose();
    super.dispose();
  }

  void _checkForChanges() {
    final bool hasChanges =
        _titleController.text.trim() != widget.noteModel.title ||
        _desController.text.trim() != widget.noteModel.subTitle;
    _hasChangesNotifier.value = hasChanges;
  }

  void _onSavePressed() {
    context.read<UpdateNoteCubit>().updateNote(
      note: widget.noteModel,
      title: _titleController.text.trim(),
      subTitle: _desController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return BlocConsumer<UpdateNoteCubit, UpdateNoteState>(
      listener: (context, state) {
        if (state is UpdateNoteSuccess) {
          context.read<NotesCubit>().fetchAllNotes();
          context.pop();
        }
      },
      builder: (context, state) {
        final isSavingProcess = state is UpdateNoteLoading;

        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFF9F9F9),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: AnimatedRotation(
                  turns: isRtl ? 0 : 0.5,
                  duration: Duration.zero,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black87,
                  ),
                ),
                onPressed: () => context.pop(),
              ),
              title: Text(
                S.of(context).editNote,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              actions: [
                ValueListenableBuilder<bool>(
                  valueListenable: _hasChangesNotifier,
                  builder: (context, hasChanges, _) {
                    if (!hasChanges) return const SizedBox.shrink();

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: IconButton(
                        onPressed: isSavingProcess ? null : _onSavePressed,
                        icon: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: isSavingProcess
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green.shade600,
                                  size: 30,
                                  key: const ValueKey('done'),
                                )
                              : Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.amber.shade700,
                                  size: 30,
                                  key: const ValueKey('edit'),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: EditAndShowNoteForm(
              noteModel: widget.noteModel,
              titleController: _titleController,
              desController: _desController,
            ),
          ),
        );
      },
    );
  }
}
