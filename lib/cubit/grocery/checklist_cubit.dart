import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/models/grocery_checklist.dart';

class ChecklistCubit extends Cubit<List<GroceryChecklist>> {
  ChecklistCubit() : super([]);

  void onCheckListUpdated(int index, bool isChecked) async {
    List<GroceryChecklist> groceries = List.from(state);
    groceries[index].isChecked = isChecked;
    emit(groceries);
  }

  void addChecklist(String title) async {
    List<GroceryChecklist> groceries = List.from(state);
    groceries.add(GroceryChecklist(title: title, isChecked: false));
    emit(groceries);
  }

  void deleteAllChecklist() async {
    emit([]);
  }
}
