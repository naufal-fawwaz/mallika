import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malika/cubit/auth/auth_state.dart';
import 'package:malika/cubit/cubit.dart';
import 'package:malika/services/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signInGoogle() async {
    emit(AuthLoading());
    try {
      final user = await AuthService().signInWithGoogle();
      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.code));
    } on AssertionError catch (_) {
      emit(AuthFailed('Login dibatalkan'));
    } catch (e) {
      emit(AuthFailed(e.toString() + e.runtimeType.toString()));
    }
  }

  void getLoggedInUser() async {
    final user = AuthService().getUser();
    if (user != null) {
      emit(AuthLoggedIn(user));
    }
  }

  void logoutUser() async {
    await AuthService().logoutUser();
    emit(AuthLogout());
  }
}
