part of 'bloc_register.dart';

sealed class BlocRegisterState extends Equatable {
  const BlocRegisterState();
  
  @override
  List<Object> get props => [];
}

final class BlocRegisterInitial extends BlocRegisterState {}
