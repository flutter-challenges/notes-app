import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart'; 
import 'package:to_do_app/core/helpers/constants.dart';
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

  void deleteMultipleNotes({required Set<dynamic> keysToDelete , required String boxNameType}) async {
    if (keysToDelete.isEmpty) return;

    emit(DeleteNoteLoading());
    try {
      final box = Hive.box<NoteModel>(boxNameType);

      if (box.isOpen) {
        await box.deleteAll(keysToDelete);
        emit(DeleteNoteSuccess());
      } else {
        emit(DeleteNoteFailure("البوكس مغلق أو غير موجود"));
      }
    } catch (e) {
      emit(DeleteNoteFailure(e.toString()));
    }
  }
}