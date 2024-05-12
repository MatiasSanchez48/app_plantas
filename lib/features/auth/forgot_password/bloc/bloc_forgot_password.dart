import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_forgot_password_event.dart';
part 'bloc_forgot_password_state.dart';

class BlocForgotPasswordBloc extends Bloc<BlocForgotPasswordEvent, BlocForgotPasswordState> {
  BlocForgotPasswordBloc() : super(BlocForgotPasswordInitial()) {
    on<BlocForgotPasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
