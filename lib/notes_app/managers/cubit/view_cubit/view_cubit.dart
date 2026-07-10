import 'package:hydrated_bloc/hydrated_bloc.dart'; 

part 'view_state.dart';

class ViewCubit extends HydratedCubit<ViewState> {
  ViewCubit() : super(ViewAsListState());

  void toggleView() {
    if (state is ViewAsListState) {
      emit(ViewAsGridState()); 
    } else {
      emit(ViewAsListState()); 
    }
  }

  @override
  ViewState? fromJson(Map<String, dynamic> json) {
    final isGrid = json['isGridView'] as bool?;
    if (isGrid == true) {
      return ViewAsGridState();
    }
    return ViewAsListState();
  }

  @override
  Map<String, dynamic>? toJson(ViewState state) {
    return {
      'isGridView': state is ViewAsGridState, 
    };
  }
}