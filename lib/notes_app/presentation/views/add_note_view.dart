import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/core/helpers/show_snack_bar_middel.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/add_note/add_note_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes/notes_cubit.dart';
import 'package:to_do_app/notes_app/presentation/widgets/add_note_body.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
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

  void _validateAndSave(BuildContext context) {
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

    final note = NoteModel(
      title: title,
      subTitle: description,
      date: DateTime.now().toString().substring(0, 10),
      color: NoteModel.noteColors[2].toARGB32(),
    );

    context.read<AddNoteCubit>().addNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          showMiddleSnackBar(state.errMessage, context);
        }
        if (state is AddNoteSuccess) {
          context.read<NotesCubit>().fetchAllNotes();

          context.pop();

          showMiddleSnackBar("تمت إضافة الملاحظة بنجاح! 🎉", context);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFF9F9F9),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black87,
                ),
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
                    onPressed: state is AddNoteLoading
                        ? null
                        : () => _validateAndSave(context),
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: switch (state) {
                        AddNoteLoading() => const SizedBox(
                          key: ValueKey('loading'),
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: Colors.green,
                            strokeWidth: 3,
                          ),
                        ),
                        _ => Icon(
                          Icons.save_as_outlined,
                          color: Colors.amber.shade700,
                          size: 28,
                          key: const ValueKey('save'),
                        ),
                      },
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
      },
    );
  }
}
