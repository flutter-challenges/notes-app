import 'package:flutter/material.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/core/helpers/show_snack_bar_middel.dart';
import 'package:to_do_app/notes_app/presentation/widgets/add_note_body.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  bool _isSaving = false;
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


  void _validateAndSave() async {
    final String title = _titleController.text.trim();
    final String description = _desController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      if (title.isEmpty && description.isEmpty) {
        showMiddleSnackBar(
          "برجاء كتابة عنوان وتفاصيل الملاحظة أولاً!",
          context,
        );
      } else if (title.isEmpty) {
        showMiddleSnackBar("برجاء كتابة عنوان الملاحظة!", context);
      } else {
        showMiddleSnackBar("برجاء كتابة تفاصيل الملاحظة!", context);
      }
      return;
    }

    setState(() {
      _isSaving = true;
    });

    await Future.delayed(const Duration(milliseconds: 450));

    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
            onPressed: () => context.pop(),
          ),
          title: const Text(
            "ملاحظة جديدة",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: IconButton(
                onPressed: _isSaving ? null : _validateAndSave,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _isSaving
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green.shade600,
                          size: 30,
                          key: const ValueKey('saved'),
                        )
                      : Icon(
                          Icons.save_as_outlined,
                          color: Colors.amber.shade700,
                          size: 28,
                          key: const ValueKey('save'),
                        ),
                ),
              ),
            ),
          ],
        ),
        body: AddNoteBody(
          titleController: _titleController,
          desController: _desController,
        ),
      ),
    );
  }
}
