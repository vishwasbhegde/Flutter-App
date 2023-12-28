// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.emailFieldController,
    this.passwordFieldController,
    this.loginModelObj,
  });

  TextEditingController? emailFieldController;

  TextEditingController? passwordFieldController;

  LoginModel? loginModelObj;

  @override
  List<Object?> get props => [
        emailFieldController,
        passwordFieldController,
        loginModelObj,
      ];
  LoginState copyWith({
    TextEditingController? emailFieldController,
    TextEditingController? passwordFieldController,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      emailFieldController: emailFieldController ?? this.emailFieldController,
      passwordFieldController:
          passwordFieldController ?? this.passwordFieldController,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
