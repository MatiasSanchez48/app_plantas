import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_settings_event.dart';
part 'bloc_settings_state.dart';

class BlocSettings extends Bloc<BlocSettingsEvent, BlocSettingsState> {
  BlocSettings() : super(BlocSettingsInitial()) {
    on<BlocSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
