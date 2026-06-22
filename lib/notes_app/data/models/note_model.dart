import 'dart:ui';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0) //? 0 ----> 223
class NoteModel extends HiveObject {
  
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String subTitle;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final int color; 

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });

  static final List<Color> noteColors = [
    const Color(0xFFE1BEE7),
    const Color(0xFFFFF9C4),
    const Color(0xFFFFCCBC),
    const Color(0xFFC8E6C9),
    const Color(0xB3E5FCFF),
  ];
}