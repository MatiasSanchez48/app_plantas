part of 'bloc_register.dart';

///TODO add description
sealed class BlocRegisterEvent extends Equatable {
  const BlocRegisterEvent();

  @override
  List<Object> get props => [];
}

class BlocRegisterEventRegister extends BlocRegisterEvent {
  const BlocRegisterEventRegister({required this.usuarioDto});

  final UsersDto usuarioDto;
}
