import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_forgot_password_event.dart';
part 'bloc_forgot_password_state.dart';

/// TODO: Add description.
class BlocForgotPassword
    extends Bloc<BlocForgotPasswordEvent, BlocForgotPasswordState> {
  BlocForgotPassword({required String token})
      : super(BlocForgotPasswordStateInitial(token: token)) {
    on<BlocForgotPasswordEventChangePassword>(_onChangePassword);
  }
  final repositoryAuth = RepositoryAuth();
  Future<void> _onChangePassword(
    BlocForgotPasswordEventChangePassword event,
    Emitter<BlocForgotPasswordState> emit,
  ) async {
    emit(BlocForgotPasswordStateLoading.from(state));
    try {
      await repositoryAuth.resetPassword(
        usuarioDto: UsersDto(
          token: state.token,
          newPassword: event.usuarioDto.newPassword,
        ),
      );

      emit(BlocForgotPasswordStateSuccessToChangePassword.from(state));
    } catch (e) {
      emit(BlocForgotPasswordStateError.from(state));
    }
  }
}
