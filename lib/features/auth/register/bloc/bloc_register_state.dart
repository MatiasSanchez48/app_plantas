part of 'bloc_register.dart';

///TODO add description
sealed class BlocRegisterState extends Equatable {
  const BlocRegisterState();

  @override
  List<Object> get props => [];
}

final class BlocRegisterStateInitial extends BlocRegisterState {}

final class BlocRegisterStateLoading extends BlocRegisterState {}

final class BlocRegisterStateSuccess extends BlocRegisterState {}

final class BlocRegisterStateSuccessToRegister extends BlocRegisterState {
  const BlocRegisterStateSuccessToRegister(this.usuario);
  final User usuario;
}

final class BlocRegisterStateError extends BlocRegisterState {}

final class BlocRegisterStateErrorUserAlreadyExists extends BlocRegisterState {}
