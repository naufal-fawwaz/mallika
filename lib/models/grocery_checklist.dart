import 'package:equatable/equatable.dart';

class GroceryChecklist extends Equatable {
  final String title;
  bool isChecked = false;

  GroceryChecklist({required this.title, this.isChecked = false});

  @override
  List<Object?> get props => [title, isChecked];
}
