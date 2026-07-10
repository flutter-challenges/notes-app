import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/view_cubit/view_cubit.dart'; // تأكد من المسار
import 'package:to_do_app/notes_app/presentation/widgets/note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, notesState) {
        return switch (notesState) {
          NotesInitial() || NotesLoading() => const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 300),
              child: Center(
                child: CircularProgressIndicator(color: Colors.amber),
              ),
            ),
          ),

          NotesSuccess(:final notes) => switch (notes) {
            [] => SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.note_alt_outlined,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).noNotesYet,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _ => BlocBuilder<ViewCubit, ViewState>(
              builder: (context, viewState) {
                return switch (viewState) {
                  ViewAsGridState() => SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.9,
                        ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return NoteItem(noteModel: notes[index]);
                    }, childCount: notes.length),
                  ),
                  ViewAsListState() => SliverList.separated(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return NoteItem(noteModel: notes[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  ),
                  _ => SizedBox.shrink(),
                };
              },
            ),
          },
        };
      },
    );
  }
}
