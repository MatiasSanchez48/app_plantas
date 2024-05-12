import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_register_event.dart';
part 'bloc_register_state.dart';

class BlocRegisterBloc extends Bloc<BlocRegisterEvent, BlocRegisterState> {
  BlocRegisterBloc() : super(BlocRegisterInitial()) {
    on<BlocRegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
