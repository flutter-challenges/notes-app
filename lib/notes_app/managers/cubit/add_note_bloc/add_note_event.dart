part of 'add_note_bloc.dart';

@immutable
abstract class AddNoteEvent {}

class AddNoteSubmittedEvent extends AddNoteEvent {
  final List<NoteModel> notes;
  final String boxName; 

  AddNoteSubmittedEvent({
    required this.notes,
    required this.boxName,
  });
}