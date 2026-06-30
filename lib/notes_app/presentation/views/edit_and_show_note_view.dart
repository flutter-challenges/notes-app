import 'package:flutter/material.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/presentation/widgets/edit_and_show_note_body.dart';

class EditAndShowNoteView extends StatefulWidget {
  final NoteModel noteModel;
  const EditAndShowNoteView({super.key, required this.noteModel});

  @override
  State<EditAndShowNoteView> createState() => _EditAndShowNoteViewState();
}

class _EditAndShowNoteViewState extends State<EditAndShowNoteView> {
  late final TextEditingController _titleController;
  late final TextEditingController _desController;
  bool _hasChanges = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.noteModel.title);
    _desController = TextEditingController(text: widget.noteModel.subTitle);
    _titleController.addListener(_checkForChanges);
    _desController.addListener(_checkForChanges);
  }

  @override
  void dispose() {
    _titleController.removeListener(_checkForChanges);
    _desController.removeListener(_checkForChanges);
    _titleController.dispose();
    _desController.dispose();
    super.dispose();
  }

  void _checkForChanges() {
    final bool changed =
        _titleController.text != widget.noteModel.title ||
        _desController.text != widget.noteModel.subTitle;

    if (changed != _hasChanges) {
      setState(() => _hasChanges = changed);
    }
  }

  void _saveNote() async {
    setState(() => _isSaving = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: AnimatedRotation(
            turns: isRtl ? 0 : 0.5,
            duration: Duration.zero,
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
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
          if (_hasChanges)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: IconButton(
                onPressed: _isSaving ? null : _saveNote,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: _isSaving
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
            ),
        ],
      ),
      body: EditAndShowNoteBody(
        noteModel: widget.noteModel,
        titleController: _titleController,
        desController: _desController,
      ),
    );
  }
}
