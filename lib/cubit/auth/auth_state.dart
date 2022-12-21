import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserCredential credential;
  AuthSuccess(this.credential);

  @override
  List<Object> get props => [credential];
}

class AuthFailed extends AuthState {
  final String errorMessage;
  AuthFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class AuthLoggedIn extends AuthState {
  final User user;
  AuthLoggedIn(this.user);

  @override
  List<Object> get props => [user];
}

class AuthLogout extends AuthState {}
