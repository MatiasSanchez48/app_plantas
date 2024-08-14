import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_users_event.dart';
part 'bloc_users_state.dart';

/// TODO: add decription
class BlocUsers extends Bloc<BlocUsersEvent, BlocUsersState> {
  BlocUsers() : super(const BlocUsersStateInitial()) {
    on<BlocUsersEventInitial>(_onGetUsers);
  }

  final repoAuth = RepositoryAuth();

  Future<void> _onGetUsers(
    BlocUsersEventInitial event,
    Emitter<BlocUsersState> emit,
  ) async {
    emit(BlocUsersStateLoading.from(state));
    try {
      final usuarios = await repoAuth.getusuarios();

      emit(BlocUsersStateSuccessToGetUsers.from(state, users: usuarios));
    } catch (e) {
      emit(BlocUsuariosStateError.from(state));
    }
  }
}
