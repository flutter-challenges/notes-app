import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());

  void deleteNote({required NoteModel note}) async {
    emit(DeleteNoteLoading());
    try {
      
      await note.delete();

      emit(DeleteNoteSuccess());
    } catch (e) {
      emit(DeleteNoteFailure(e.toString()));
    }
  }

  
}
