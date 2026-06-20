import 'package:flutter/material.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/core/routing/routes.dart';

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
        context.pushNamed(AppRoutes.addNoteView);
      },
      child: const Icon(Icons.add, color: Colors.white, size: 28),
    );
  }
}