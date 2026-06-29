import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do_app/core/routing/app_router.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/generated/l10n.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('fr'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(useMaterial3: true),
      initialRoute: AppRoutes.noteView,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
