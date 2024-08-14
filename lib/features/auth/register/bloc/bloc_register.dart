import 'package:app_plantas/models/users.dart';
import 'package:app_plantas/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_register_event.dart';
part 'bloc_register_state.dart';

///TODO add description
class BlocRegister extends Bloc<BlocRegisterEvent, BlocRegisterState> {
  BlocRegister() : super(BlocRegisterStateInitial()) {
    on<BlocRegisterEventRegister>(_onRegister);
  }

  final repositoryAuth = RepositoryAuth();

  Future<void> _onRegister(
    BlocRegisterEventRegister event,
    Emitter<BlocRegisterState> emit,
  ) async {
    emit(BlocRegisterStateInitial());
    try {
      final usuario = await repositoryAuth.register(usuarioDto: event.usuarioDto);
      emit(BlocRegisterStateSuccessToRegister(usuario));
    } catch (e) {
      emit(BlocRegisterStateErrorUserAlreadyExists());
    }
  }
}
