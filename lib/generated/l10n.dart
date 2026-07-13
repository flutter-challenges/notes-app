// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Notes`
  String get myNotes {
    return Intl.message('My Notes', name: 'myNotes', desc: '', args: []);
  }

  /// `No notes yet.. Add your first note!`
  String get noNotesYet {
    return Intl.message(
      'No notes yet.. Add your first note!',
      name: 'noNotesYet',
      desc: '',
      args: [],
    );
  }

  /// `New Note`
  String get newNote {
    return Intl.message('New Note', name: 'newNote', desc: '', args: []);
  }

  /// `Edit Note`
  String get editNote {
    return Intl.message('Edit Note', name: 'editNote', desc: '', args: []);
  }

  /// `Last edit: {date}`
  String lastEdit(Object date) {
    return Intl.message(
      'Last edit: $date',
      name: 'lastEdit',
      desc: '',
      args: [date],
    );
  }

  /// `Please write a title and details for the note first!`
  String get errorEmptyTitleAndDesc {
    return Intl.message(
      'Please write a title and details for the note first!',
      name: 'errorEmptyTitleAndDesc',
      desc: '',
      args: [],
    );
  }

  /// `Please write the note title!`
  String get errorEmptyTitle {
    return Intl.message(
      'Please write the note title!',
      name: 'errorEmptyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please write the note details!`
  String get errorEmptyDesc {
    return Intl.message(
      'Please write the note details!',
      name: 'errorEmptyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Note added successfully! 🎉`
  String get successAddNote {
    return Intl.message(
      'Note added successfully! 🎉',
      name: 'successAddNote',
      desc: '',
      args: [],
    );
  }

  /// `Note Title...`
  String get noteTitleHint {
    return Intl.message(
      'Note Title...',
      name: 'noteTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Write your note details here...`
  String get noteDetailsHint {
    return Intl.message(
      'Write your note details here...',
      name: 'noteDetailsHint',
      desc: '',
      args: [],
    );
  }

  /// `an error occured while saving note...`
  String get failureMessage {
    return Intl.message(
      'an error occured while saving note...',
      name: 'failureMessage',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete Note`
  String get deleteNote {
    return Intl.message('Delete Note', name: 'deleteNote', desc: '', args: []);
  }

  /// `Are you sure you want to delete this note?`
  String get deleteNoteConfirmation {
    return Intl.message(
      'Are you sure you want to delete this note?',
      name: 'deleteNoteConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Note deleted successfully`
  String get NoteDeletedSuccessfully {
    return Intl.message(
      'Note deleted successfully',
      name: 'NoteDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Move to Private`
  String get moveToPrivate {
    return Intl.message(
      'Move to Private',
      name: 'moveToPrivate',
      desc: '',
      args: [],
    );
  }

  /// `Move to Public`
  String get moveToPublic {
    return Intl.message(
      'Move to Public',
      name: 'moveToPublic',
      desc: '',
      args: [],
    );
  }

  /// `Private Notes`
  String get privateNotes {
    return Intl.message(
      'Private Notes',
      name: 'privateNotes',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
