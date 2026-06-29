import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/core/routing/routes.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';

class NoteItem extends StatelessWidget {
  final NoteModel noteModel;
  const NoteItem({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {
    final Color baseColor = Color(noteModel.color);
    
    // تنسيق التاريخ والوقت بشكل ريق ومودرن
    // النتيجة هتكون شبه كده: Jun 26, 2026 • 11:45 PM
// 1. الحل السريع: تمرير الـ locale كـ String مباشرة جوة الـ Constructor
// String formattedDate = DateFormat('MMM d, yyyy • h:mm a', 'ar').format(noteModel.date);

// 2. الحل الديناميكي (الأصح): يقرأ لغة التطبيق الحالية أوتوماتيك لو اتغيرت
String formattedDate = DateFormat.yMMMd(Localizations.localeOf(context).toString())
    .add_jm() // عشان يضيف الوقت (الساعة والدقيقة)
    .format(noteModel.date);
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          context.pushNamed(AppRoutes.editAndShowNoteView, argument: noteModel);
        },
        splashColor: Colors.black.withOpacity(0.05),
        highlightColor: Colors.black.withOpacity(0.02),
        child: Ink(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: baseColor.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      noteModel.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Transform.translate(
                    offset: const Offset(8, -8),
                    child: IconButton(
                      onPressed: () {
                        // noteModel.delete(); // دالة مدمجة في HiveObject لمسح العنصر فوراً!
                        // تلميح: ستحتاج لاستدعاء fetchAllNotes بعد الحذف لتحديث الـ UI
                      },
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.black.withOpacity(0.55),
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                noteModel.subTitle,
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.black.withOpacity(0.65),
                  height: 1.4,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              // سطر التوقيت السفلي مع إضافة أيقونة ساعة خفيفة لجمال التصميم
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: 14,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.4),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}