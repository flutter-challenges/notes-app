abstract class MoveNoteState {}

class MoveNoteInitial extends MoveNoteState {}
class MoveNoteLoading extends MoveNoteState {}
class MoveNoteSuccess extends MoveNoteState {}
class MoveNoteFailure extends MoveNoteState {
  final String errorMessage;
  MoveNoteFailure({required this.errorMessage});
}