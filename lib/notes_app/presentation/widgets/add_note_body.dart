import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_note_text_field.dart';
import 'package:to_do_app/notes_app/presentation/widgets/media_action_button.dart';

class AddNoteBody extends StatefulWidget {
  const AddNoteBody({super.key});

  @override
  State<AddNoteBody> createState() => _AddNoteBodyState();
}

class _AddNoteBodyState extends State<AddNoteBody> {
  late TextEditingController _titleController;
  late TextEditingController _desController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _desController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomNoteTextField(
                  controller: _titleController,
                  hintAr: "عنوان الملاحظة...",
                  hintEn: "Note Title...",
                ),
                const SizedBox(height: 16),

                CustomNoteTextField(
                  controller: _desController,
                  maxLines: 20,
                  hintAr: "اكتب تفاصيل ملاحظتك هنا...",
                  hintEn: "Write your note details here...",
                ),
              ],
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom + 12,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, -3), 
              ),
            ],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Row(
            children: [
              const Text(
                "إضافة إلى الملاحظة:",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),

              MediaActionWidget(
                icon: Icons.image_rounded,
                color: Colors.green,
                onTap: () {},
              ),

              MediaActionWidget(
                icon: Icons.video_collection_rounded,
                color: Colors.redAccent,
                onTap: () {},
              ),

              MediaActionWidget(
                icon: Icons.mic_rounded,
                color: Colors.blue,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
