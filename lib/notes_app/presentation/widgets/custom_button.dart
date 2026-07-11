import 'package:flutter/material.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/managers/cubit/add_note_bloc/add_note_bloc.dart';

class CustomButton extends StatelessWidget {
  final AddNoteState state;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.state, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:Theme.of(context).primaryColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: state is AddNoteLoading ? null : onPressed,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: state is AddNoteLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                    )
                  : Text(
                      S.of(context).save , 
                      style:  TextStyle(color: Theme.of(context).textTheme.titleLarge?.color, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        );
  }
}