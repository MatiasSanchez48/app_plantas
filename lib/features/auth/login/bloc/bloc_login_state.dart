part of 'bloc_login.dart';

sealed class BlocLoginState extends Equatable {
  const BlocLoginState();
  
  @override
  List<Object> get props => [];
}

final class BlocLoginInitial extends BlocLoginState {}
