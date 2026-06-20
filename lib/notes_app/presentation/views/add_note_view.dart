import 'package:flutter/material.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/notes_app/presentation/widgets/add_note_body.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  bool _isSaving = false;

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
            onPressed: () => Navigator.pop(context),
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
                onPressed: _isSaving
                    ? null
                    : () async {
                        setState(() {
                          _isSaving = true;
                        });
                        await Future.delayed(const Duration(milliseconds: 450));
                        if (!mounted) return;
                        context.pop();
                      },
                icon: AnimatedSwitcher(
                  duration: const Duration(
                    milliseconds: 200,
                  ), 
                  child: _isSaving
                      ? Icon(
                          Icons.check_circle,
                          color: Colors
                              .green
                              .shade600,
                          size: 30,
                          key: const ValueKey('saved'),
                        )
                      : Icon(
                          Icons
                              .save_as_outlined, 
                          color: Colors.amber.shade700,
                          size: 28,
                          key: const ValueKey('save'),
                        ),
                ),
              ),
            ),
          ],
        ),
        body: const AddNoteBody(),
      ),
    );
  }
}
