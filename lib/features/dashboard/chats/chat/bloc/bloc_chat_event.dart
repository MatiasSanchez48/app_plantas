part of 'bloc_chat.dart';

sealed class BlocChatEvent extends Equatable {
  const BlocChatEvent();

  @override
  List<Object> get props => [];
}

class BlocChatEventInitial extends BlocChatEvent {
  const BlocChatEventInitial({required this.idUser});

  final String idUser;
}

class BlocChatEventSendMessage extends BlocChatEvent {
  const BlocChatEventSendMessage({required this.message});

  final String message;
}
