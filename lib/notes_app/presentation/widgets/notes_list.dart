import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes/notes_cubit.dart';
import 'package:to_do_app/notes_app/presentation/widgets/note_item.dart';

class NotesList extends StatelessWidget {
  const NotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return switch (state) {
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
                          "لا توجد ملاحظات بعد.. اضف ملاحظتك الأولى!",
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

              _ => SliverList.separated(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return NoteItem(
                      noteModel: note,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                ),
            },
        };
      },
    );
  }
}