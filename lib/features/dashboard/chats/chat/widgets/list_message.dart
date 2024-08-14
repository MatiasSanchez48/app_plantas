import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/chats/chat/bloc/bloc_chat.dart';
import 'package:app_plantas/features/dashboard/chats/chat/widgets/widgets.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMessage extends StatefulWidget {
  const ListMessage({
    super.key,
  });

  @override
  State<ListMessage> createState() => _ListMessageState();
}

class _ListMessageState extends State<ListMessage> {
  final TextEditingController _controllerMessage = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controllerMessage.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Asegúrate de desplazar al final al cargar la pantalla
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _onSendMessage(BuildContext context) {
    if (_controllerMessage.text.isNotEmpty) {
      context.read<BlocChat>().add(
            BlocChatEventSendMessage(
              message: _controllerMessage.text,
            ),
          );
      _controllerMessage.clear();
    }
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocBuilder<BlocChat, BlocChatState>(
      builder: (context, state) {
        _scrollToBottom();
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: state.messages
                      .map(
                        (e) => ComponentMessage(
                          idAutor: e.autorId ?? '',
                          message: e.mensaje ?? '',
                          creationDate: e.fechaCreacion ?? DateTime.now(),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Divider(
              height: .5,
              thickness: .5,
              color: colors.onBackground,
            ),
            Row(
              children: [
                Expanded(
                  child: PlantsTextFormField(
                    controller: _controllerMessage,
                    onEditingComplete: () => _onSendMessage(context),
                  ),
                ),
                PlantsBotton(
                  backgoundColor: colors.background,
                  child: Icon(
                    Icons.send_outlined,
                    color: colors.onBackground,
                  ),
                  onPressed: () => _onSendMessage(context),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
