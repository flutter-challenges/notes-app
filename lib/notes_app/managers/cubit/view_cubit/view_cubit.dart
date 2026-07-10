import 'package:flutter_bloc/flutter_bloc.dart';

part 'view_state.dart';

class ViewCubit extends Cubit<ViewState> {
  ViewCubit() : super(ViewAsListState());

  void toggleView() {
    if (state is ViewAsListState) {
      emit(ViewAsGridState()); 
    } else {
      emit(ViewAsListState()); 
    }
  }
}