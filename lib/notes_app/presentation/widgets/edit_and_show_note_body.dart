import 'package:flutter/material.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_note_text_field.dart';

class EditAndShowNoteBody extends StatefulWidget {
  final NoteModel noteModel;
  const EditAndShowNoteBody({super.key, required this.noteModel});

  @override
  State<EditAndShowNoteBody> createState() => _EditAndShowNoteBodyState();
}

class _EditAndShowNoteBodyState extends State<EditAndShowNoteBody> {
  late TextEditingController _titleController;
  late TextEditingController _desController;
  //? depende on _checkForChanges
  bool _hasChanges = false;
  //? depende on _saveNote
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
      setState(() {
        _hasChanges = changed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
            onPressed: () => context.pop(),
          ),
          title: const Text(
            "تعديل الملاحظة",
            style: TextStyle(
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
                          )
                        : Icon(
                            Icons.check_circle_outline,
                            color: Colors.amber.shade700,
                            size: 30,
                          ),
                  ),
                ),
              ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "آخر تعديل: ${widget.noteModel.date}",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),

                CustomNoteTextField(
                  controller: _titleController,
                  hintAr: "عنوان الملاحظة...",
                  hintEn: "Note Title...",
                ),
                const SizedBox(height: 16),

                CustomNoteTextField(
                  controller: _desController,
                  maxLines: 25,
                  hintAr: "اكتب تفاصيل ملاحظتك هنا...",
                  hintEn: "Write your note details here...",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _saveNote() async {
    setState(() {
      _isSaving = true;
    });
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    context.pop();
  }
}
