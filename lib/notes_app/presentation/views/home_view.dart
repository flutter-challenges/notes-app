import 'package:flutter/material.dart';
import 'package:to_do_app/notes_app/presentation/widgets/note_item.dart' hide Colors;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> noteColors = [
       Color(mapColor(0xFFFFF9C4)), 
       Color(mapColor(0xFFFFCCBC)), 
       Color(mapColor(0xFFE1BEE7)), 
       Color(mapColor(0xFFC8E6C9)), 
       Color(mapColor(0xB3E5FCFF)), 
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber.shade700,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            floating: true,
            title: Text(
              "My Notes", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            actions: [
              IconButton(onPressed: _dummyAction, icon: Icon(Icons.search)),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.85, 
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return NoteItem(
                    cardColor: noteColors[index % noteColors.length],
                  );
                },
                childCount: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

int mapColor(int value) => value;
void _dummyAction() {}