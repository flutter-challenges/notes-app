import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/custom_middel_snack_bar.dart';
import 'package:to_do_app/core/helpers/extension.dart';
import 'package:to_do_app/generated/l10n.dart';
import 'package:to_do_app/notes_app/managers/cubit/add_note_bloc/add_note_bloc.dart';
import 'package:to_do_app/notes_app/managers/cubit/box_type/box_type_cubit.dart';
import 'package:to_do_app/notes_app/managers/cubit/show_all_notes_cubit/notes_cubit.dart';
import 'package:to_do_app/notes_app/presentation/widgets/add_note_form.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          icon: AnimatedRotation(
            turns: isArabic ? 0 : 0.5,
            duration: Duration.zero,
            child:  Icon(Icons.arrow_back_ios_new, color:Theme.of(context).appBarTheme.iconTheme?.color),
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          S.of(context).newNote,
          style:  TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocConsumer<AddNoteBloc, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            CustomMiddleSnackBar.show(
              context, 
              message: state.errMessage, 
              type: MiddleSnackBarType.error,
            );
          }
          if (state is AddNoteSuccess) {
            context.read<NotesCubit>().fetchAllNotes(boxNameType: context.read<BoxTypeCubit>().state.boxName);
            context.pop();
            CustomMiddleSnackBar.show(
              context, 
              message: S.of(context).successAddNote, 
              type: MiddleSnackBarType.success,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: AddNoteForm(state: state),
          );
        },
      ),
    );
  }
}