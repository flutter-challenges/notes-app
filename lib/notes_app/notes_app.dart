import 'package:flutter/material.dart';
import 'package:to_do_app/core/routing/app_router.dart';
import 'package:to_do_app/core/routing/routes.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(useMaterial3: true),
      initialRoute: AppRoutes.noteView,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}