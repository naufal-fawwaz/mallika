part of 'recipe_schedule_cubit_cubit.dart';

class RecipeScheduleCubitState extends Equatable {
  final DateTime date;
  final int currentChosenDate;

  const RecipeScheduleCubitState({
    required this.date,
    this.currentChosenDate = 1,
  });

  @override
  List<Object> get props => [date, currentChosenDate];
}
