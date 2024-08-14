part of 'bloc_login.dart';

///TODO: add description
sealed class BlocLoginState extends Equatable {
  const BlocLoginState();

  @override
  List<Object> get props => [];
}

final class BlocLoginStateInitial extends BlocLoginState {}

final class BlocLoginStateLoading extends BlocLoginState {}

final class BlocLoginStateSendingToken extends BlocLoginState {}

final class BlocLoginStateSuccess extends BlocLoginState {}

final class BlocLoginStateSuccessToLogin extends BlocLoginState {
  const BlocLoginStateSuccessToLogin(this.usuario);
  final User usuario;
}

final class BlocLoginStateSuccessToSendEmailRecoveryPassword
    extends BlocLoginState {
  const BlocLoginStateSuccessToSendEmailRecoveryPassword(this.token);
  final String token;
}

final class BlocLoginStateErrorToSendEmailRecoveryPassword
    extends BlocLoginState {}

final class BlocLoginStateErrorUserNotFound extends BlocLoginState {}
