import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistCubit extends Cubit<Map<String, bool>> {
  ChecklistCubit()
      : super({
          'Jeruk 2 kilo': false,
          'Super 2 batang': false,
        });

  void onCheckListUpdated(String key, bool isChecked) {
    Map<String, bool> newState = state;
    newState[key] = isChecked;
    emit(newState);
  }
}
