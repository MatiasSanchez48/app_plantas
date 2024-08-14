import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bloc_chat_event.dart';
part 'bloc_chat_state.dart';

/// TODO: Add description.
class BlocChat extends Bloc<BlocChatEvent, BlocChatState> {
  BlocChat() : super(const BlocChatStateInitial()) {
    on<BlocChatEventInitial>(_onInitial);
    on<BlocChatEventSendMessage>(_onSendMessage);
  }
  final repoAuth = RepositoryAuth();
  final _repoChat = RepositoryChat();
  final _sharedPreferencesHelper = SharedPreferencesHelper();

  Future<void> _onInitial(
    BlocChatEventInitial event,
    Emitter<BlocChatState> emit,
  ) async {
    emit(BlocChatStateLoading.from(state));
    try {
      final userSend = await repoAuth.getUsuarioById(id: event.idUser);

      final myUser = await _sharedPreferencesHelper.getUser();

      await _repoChat.configureSignalR();
      await _repoChat.startConnection();

      await _repoChat.joinRoom(usuario: myUser!, userSend: userSend);
      emit(BlocChatStateSuccess.from(state));
    } catch (e) {
      emit(BlocChatStateError.from(state));
    }
  }

  Future<void> _onSendMessage(
    BlocChatEventSendMessage event,
    Emitter<BlocChatState> emit,
  ) async {
    emit(BlocChatStateLoading.from(state));
    try {
      final messages = await _repoChat.sendMessage(event.message);

      emit(BlocChatStateSuccess.from(state, messages: messages));
    } catch (e) {
      emit(BlocChatStateError.from(state));
    }
  }
}
