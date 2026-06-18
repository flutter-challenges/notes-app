import 'dart:ui';

class NoteModel {
  final String title;
  final String subTitle;
  final String date;

  NoteModel({required this.title, required this.subTitle, required this.date});
  static final List<Color> noteColors = [
    Color(0xFFE1BEE7),
    Color(0xFFFFF9C4),
    Color(0xFFFFCCBC),
    Color(0xFFC8E6C9),
    Color(0xB3E5FCFF),
  ];
}
