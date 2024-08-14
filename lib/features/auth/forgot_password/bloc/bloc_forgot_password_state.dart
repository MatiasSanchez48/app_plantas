part of 'bloc_forgot_password.dart';

/// TODO: Add description.
class BlocForgotPasswordState extends Equatable {
  const BlocForgotPasswordState._({this.token = ''});
  BlocForgotPasswordState.from(
    BlocForgotPasswordState state, {
    String? token,
  }) : this._(token: token ?? state.token);

  final String token;

  @override
  List<Object> get props => [
        token,
      ];
}

class BlocForgotPasswordStateInitial extends BlocForgotPasswordState {
  const BlocForgotPasswordStateInitial({super.token}) : super._();
}

class BlocForgotPasswordStateLoading extends BlocForgotPasswordState {
  BlocForgotPasswordStateLoading.from(super.state) : super.from();
}

class BlocForgotPasswordStateSuccessToChangePassword
    extends BlocForgotPasswordState {
  BlocForgotPasswordStateSuccessToChangePassword.from(super.state)
      : super.from();
}

class BlocForgotPasswordStateError extends BlocForgotPasswordState {
  BlocForgotPasswordStateError.from(super.state) : super.from();
}
