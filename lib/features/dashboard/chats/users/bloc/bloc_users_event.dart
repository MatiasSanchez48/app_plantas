part of 'bloc_users.dart';

/// TODO: add decription
sealed class BlocUsersEvent extends Equatable {
  const BlocUsersEvent();

  @override
  List<Object> get props => [];
}

class BlocUsersEventInitial extends BlocUsersEvent {
  const BlocUsersEventInitial();
}
