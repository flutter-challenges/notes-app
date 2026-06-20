import 'package:flutter/material.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/notes_app/presentation/views/add_note_view.dart';
import 'package:to_do_app/notes_app/presentation/views/notes_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppRoutes.noteView => MaterialPageRoute(
          builder: (context) => const NotesView(),
        ),

      AppRoutes.addNoteView => MaterialPageRoute(
          builder: (context) => const AddNoteView(),
        ),

      _ => MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        ),
    };
  }
}