import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/presentation/views/add_note_view.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.amber.shade700,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddNoteView()),
        );
      },
      child: const Icon(Icons.add, color: Colors.white, size: 28),
    );
  }
}