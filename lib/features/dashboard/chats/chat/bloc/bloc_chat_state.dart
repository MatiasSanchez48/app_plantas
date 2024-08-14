part of 'bloc_chat.dart';

sealed class BlocChatState extends Equatable {
  const BlocChatState._({
    this.messages = const [],
  });

  BlocChatState.from(
    BlocChatState state, {
    List<Mensaje>? messages,
  }) : this._(
          messages: messages ?? state.messages,
        );

  final List<Mensaje> messages;

  @override
  List<Object> get props => [
        messages,
      ];
}

final class BlocChatStateInitial extends BlocChatState {
  const BlocChatStateInitial() : super._();
}

final class BlocChatStateLoading extends BlocChatState {
  BlocChatStateLoading.from(super.state) : super.from();
}

final class BlocChatStateSuccess extends BlocChatState {
  BlocChatStateSuccess.from(
    super.state, {
    super.messages,
  }) : super.from();
}

final class BlocChatStateError extends BlocChatState {
  BlocChatStateError.from(super.state) : super.from();
}
