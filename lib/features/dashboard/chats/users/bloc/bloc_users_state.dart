part of 'bloc_users.dart';

/// TODO: add decription
class BlocUsersState extends Equatable {
  const BlocUsersState._({
    this.users = const [],
  });

  BlocUsersState.from(
    BlocUsersState state, {
    List<User>? users,
  }) : this._(
          users: users ?? state.users,
        );

  final List<User> users;

  @override
  List<Object> get props => [
        users,
      ];
}

class BlocUsersStateInitial extends BlocUsersState {
  const BlocUsersStateInitial() : super._();
}

class BlocUsersStateLoading extends BlocUsersState {
  BlocUsersStateLoading.from(super.state) : super.from();
}

class BlocUsersStateSuccess extends BlocUsersState {
  BlocUsersStateSuccess.from(super.state) : super.from();
}

class BlocUsersStateSuccessToGetUsers extends BlocUsersState {
  BlocUsersStateSuccessToGetUsers.from(
    super.state, {
    required List<User> users,
  }) : super.from(
          users: users,
        );
}

class BlocUsuariosStateError extends BlocUsersState {
  BlocUsuariosStateError.from(super.state) : super.from();
}
