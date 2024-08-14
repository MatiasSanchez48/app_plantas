part of 'bloc_forgot_password.dart';

/// TODO: Add description.
 class BlocForgotPasswordEvent extends Equatable {
  const BlocForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class BlocForgotPasswordEventChangePassword extends BlocForgotPasswordEvent {
  const BlocForgotPasswordEventChangePassword({
    required this.usuarioDto,
  });

  final UsersDto usuarioDto;
}
