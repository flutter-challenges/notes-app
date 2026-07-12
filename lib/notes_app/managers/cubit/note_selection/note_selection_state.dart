class NoteSelectionState {
  final Set<dynamic> selectedNoteKeys;

  NoteSelectionState({required this.selectedNoteKeys});

  bool get isSelectionMode => selectedNoteKeys.isNotEmpty;

  NoteSelectionState copyWith({Set<dynamic>? selectedNoteKeys}) {
    return NoteSelectionState(
      selectedNoteKeys: selectedNoteKeys ?? this.selectedNoteKeys,
    );
  }
}