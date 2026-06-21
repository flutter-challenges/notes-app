import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/core/helpers/constants.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/notes_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(AppConstants.kNotesBox);
  runApp(NotesApp());
}
