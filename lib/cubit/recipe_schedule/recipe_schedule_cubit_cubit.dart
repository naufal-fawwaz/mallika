import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recipe_schedule_cubit_state.dart';

class RecipeScheduleCubit extends Cubit<RecipeScheduleCubitState> {
  RecipeScheduleCubit()
      : super(RecipeScheduleCubitState(
          date: DateTime.now(),
          currentChosenDate: DateTime.now().day,
        ));

  void onUpdateCurrentDate(int currentDate) {
    emit(RecipeScheduleCubitState(
      date: DateTime.now(),
      currentChosenDate: currentDate,
    ));
  }
}
