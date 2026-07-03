part of 'delete_note_cubit.dart';

@immutable
sealed class DeleteNoteState {}

class DeleteNoteInitial extends DeleteNoteState {}
class DeleteNoteLoading extends DeleteNoteState {}
class DeleteNoteSuccess extends DeleteNoteState {}
class DeleteNoteFailure extends DeleteNoteState {
  final String errorMessage;
  DeleteNoteFailure(this.errorMessage);
}