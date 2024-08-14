import 'package:app_plantas/features/dashboard/chats/chat/bloc/bloc_chat.dart';
import 'package:app_plantas/features/dashboard/chats/chat/widgets/widgets.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PageChat extends StatelessWidget {
  const PageChat({
    @PathParam('id') required this.idUser,
    super.key,
  });

  final String idUser;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocChat>(
      create: (context) =>
          BlocChat()..add(BlocChatEventInitial(idUser: idUser)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Chat App'),
        ),
        body: BlocBuilder<BlocChat, BlocChatState>(
          builder: (context, state) {
            return const ListMessage();
          },
        ),
      ),
    );
  }
}
