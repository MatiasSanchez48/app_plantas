import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/models/users.dart';
import 'package:app_plantas/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_login_event.dart';
part 'bloc_login_state.dart';

///TODO: add description
class BlocLogin extends Bloc<BlocLoginEvent, BlocLoginState> {
  BlocLogin() : super(BlocLoginStateInitial()) {
    on<BlocLoginEventLogin>(_onLogin);
    on<BlocLoginEventResetPassword>(_onResetPassword);
  }

  final repositoryAuth = RepositoryAuth();
  final _sharedPreferencesHelper = SharedPreferencesHelper();
  Future<void> _onLogin(
    BlocLoginEventLogin event,
    Emitter<BlocLoginState> emit,
  ) async {
    emit(BlocLoginStateLoading());
    try {
      final usuario = await repositoryAuth.login(usuarioDto: event.usuarioDto);

      await _sharedPreferencesHelper.saveUser(usuario);

      emit(BlocLoginStateSuccessToLogin(usuario));
    } catch (e) {
      emit(BlocLoginStateErrorUserNotFound());
    }
  }

  Future<void> _onResetPassword(
    BlocLoginEventResetPassword event,
    Emitter<BlocLoginState> emit,
  ) async {
    emit(BlocLoginStateLoading());
    try {
      final token =
          await repositoryAuth.requestRecovery(usuarioDto: event.usuarioDto);

      emit(BlocLoginStateSuccessToSendEmailRecoveryPassword(token));
    } catch (e) {
      emit(BlocLoginStateErrorToSendEmailRecoveryPassword());
    }
  }
}
