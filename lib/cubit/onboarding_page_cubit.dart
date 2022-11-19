import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPageCubit extends Cubit<int> {
  OnboardingPageCubit() : super(0);

  void setPage(int currentPage) {
    emit(currentPage);
  }
}
