import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/presentation/views/home_view.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}