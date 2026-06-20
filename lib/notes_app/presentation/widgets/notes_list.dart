import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/presentation/widgets/note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) => NoteItem(
        cardColor: NoteModel.noteColors[0],
        noteModel: NoteModel(
          color: 5,
          title: "Flutter Tips & tricks",
          subTitle: "build your career & brain with our lord jesus.",
          date: "2004/1/20",
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
    );
  }
}