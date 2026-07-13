import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/add_note_bloc/add_note_bloc.dart';
import 'package:to_do_app/notes_app/managers/cubit/box_type/box_type_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/delete_note/delete_note_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/note_selection/note_selection_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/update_note/update_note_cubit.dart';
import 'package:to_do_app/notes_app/presentation/views/add_note_view.dart';
import 'package:to_do_app/notes_app/presentation/views/edit_and_show_note_view.dart';
import 'package:to_do_app/notes_app/presentation/views/notes_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppRoutes.noteView => MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NotesCubit()..fetchAllNotes(boxNameType: context.read<BoxTypeCubit>().state.boxName)),
            BlocProvider(create: (context) => DeleteNoteCubit()),
            BlocProvider(create: (context) => NoteSelectionCubit()),
          ],
          child: const NotesView(),
        ),
      ),

      AppRoutes.addNoteView => MaterialPageRoute(
        builder: (context) {
          final notesCubit = settings.arguments as NotesCubit;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => AddNoteBloc()),
              BlocProvider.value(value: notesCubit),
            ],
            child: const AddNoteView(),
          );
        },
      ),

      AppRoutes.editAndShowNoteView => MaterialPageRoute(
        builder: (context) {
          final args = settings.arguments as Map<String, dynamic>;
          final noteModel = args['noteModel'] as NoteModel;
          final notesCubit = args['notesCubit'] as NotesCubit;

          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => UpdateNoteCubit()),
              BlocProvider.value(value: notesCubit),
            ],
            child: EditAndShowNoteView(noteModel: noteModel),
          );
        },
      ),

      _ => MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      ),
    };
  }
}
