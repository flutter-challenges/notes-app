import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';

part 'add_note_event.dart';
part 'add_note_state.dart';

class AddNoteBloc extends Bloc<AddNoteEvent, AddNoteState> {
  AddNoteBloc() : super(AddNoteInitial()) {
    on<AddNoteSubmittedEvent>(
      _onAddNoteSubmitted,
      transformer: droppable(), 
    );
  }

  Future<void> _onAddNoteSubmitted(
    AddNoteSubmittedEvent event, 
    Emitter<AddNoteState> emit,
  ) async {
    if (event.notes.isEmpty) return;
    emit(AddNoteLoading());
    await Future.delayed(const Duration(seconds: 1)); 
    
    try {
      final targetBoxName = event.boxNameType ;
      var notesBox = Hive.box<NoteModel>(targetBoxName);
      
      await notesBox.addAll(event.notes);
      
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure("حدث خطأ أثناء حفظ الملاحظات: ${e.toString()}"));
    }
  }
}