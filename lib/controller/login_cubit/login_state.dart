part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccessState extends LoginState {
  LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}

final class LoginLoadingState extends LoginState {}

final class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState(this.message);
}

final class ChangePasswordState extends LoginState {}

final class ChangeRememberMeState extends LoginState {}
