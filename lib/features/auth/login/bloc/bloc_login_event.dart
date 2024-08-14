part of 'bloc_login.dart';

///TODO: add description
class BlocLoginEvent extends Equatable {
  const BlocLoginEvent();

  @override
  List<Object> get props => [];
}

class BlocLoginEventLogin extends BlocLoginEvent {
  const BlocLoginEventLogin({required this.usuarioDto});
  final UsersDto usuarioDto;
}

class BlocLoginEventResetPassword extends BlocLoginEvent {
  const BlocLoginEventResetPassword({required this.usuarioDto});
  final UsersDto usuarioDto;
}
