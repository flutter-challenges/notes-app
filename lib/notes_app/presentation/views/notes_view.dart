import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_app_bar.dart';
import 'package:to_do_app/notes_app/presentation/widgets/custom_floating_action_button.dart';
import 'package:to_do_app/notes_app/presentation/widgets/notes_list.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(),
        body: CustomScrollView(
          slivers: [
            CustomAppBar(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              sliver: NotesList(),
            ),
          ],
        ),
      ),
    );
  }
}



