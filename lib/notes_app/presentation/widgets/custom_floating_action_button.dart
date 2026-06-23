import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes/notes_cubit.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.amber.shade700,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: () {
        Navigator.pushNamed(
          context,
          AppRoutes.addNoteView,
          arguments: context
              .read<NotesCubit>(),
        );
      },
      child: const Icon(Icons.add, color: Colors.white, size: 28),
    );
  }
}
