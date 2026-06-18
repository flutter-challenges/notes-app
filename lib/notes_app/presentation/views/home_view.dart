import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/presentation/widgets/note_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.amber.shade700,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color.fromARGB(255, 255, 219, 196),
              pinned: true,
              title: Text(
                "My Notes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search_sharp ,size: 30,))],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              sliver: SliverList.separated(
                itemCount: 10,
                itemBuilder: (context , index) => NoteItem(
                    cardColor: NoteModel.noteColors[0],
                    noteModel: NoteModel(
                      title: "Flutter Tips & tricks",
                      subTitle: "build your career & brain with our lord jesus.",
                      date: "2004/1/20",
                    ),
                  ),
                separatorBuilder: (context ,index)=> const SizedBox(height: 20,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
