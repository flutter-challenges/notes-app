import 'package:flutter/material.dart';
import 'package:to_do_app/generated/l10n.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 255, 219, 196),
      floating: true, 
      title:  Text(
        // "My Notes",
        S.of(context).myNotes,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_sharp, size: 30),
        )
      ],
    );
  }
}
