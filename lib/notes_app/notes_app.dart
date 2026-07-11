import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do_app/core/routing/app_router.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/core/theme/theme_data.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/managers/cubit/locale_cubit/locale_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/theme_cubit/theme_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/view_cubit/view_cubit.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => ViewCubit()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, currentLocale) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp(
                locale: currentLocale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                title: 'Notes App',
                theme: AppThemeData.getLightTheme(),
                darkTheme: AppThemeData.getDarkTheme(),
                themeMode: themeMode,
                initialRoute: AppRoutes.noteView,
                onGenerateRoute: AppRouter.onGenerateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
