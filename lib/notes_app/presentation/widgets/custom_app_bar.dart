import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 255, 219, 196),
      floating: true, 
      title: const Text(
        "My Notes",
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
