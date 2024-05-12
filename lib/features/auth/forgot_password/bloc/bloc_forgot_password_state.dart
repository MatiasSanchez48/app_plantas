part of 'bloc_forgot_password.dart';

sealed class BlocForgotPasswordState extends Equatable {
  const BlocForgotPasswordState();
  
  @override
  List<Object> get props => [];
}

final class BlocForgotPasswordInitial extends BlocForgotPasswordState {}
