part of 'add_note_bloc.dart';

@immutable
sealed class AddNoteEvent {}

class AddNoteSubmittedEvent extends AddNoteEvent {
  final NoteModel note;
  AddNoteSubmittedEvent(this.note);
}