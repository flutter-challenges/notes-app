import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helpers/constants.dart';
import 'box_type_state.dart';

class BoxTypeCubit extends Cubit<BoxTypeState> {
  BoxTypeCubit()
      : super(BoxTypeState(
          isPrivateMode: false,
          boxName: AppConstants.kNotesBox, 
        ));

  void toggleBoxType() {
    if (state.isPrivateMode) {
      emit(BoxTypeState(
        isPrivateMode: false,
        boxName: AppConstants.kNotesBox,
      ));
    } else {
      emit(BoxTypeState(
        isPrivateMode: true,
        boxName: AppConstants.kPrivateNotesBox,
      ));
    }
  }
}