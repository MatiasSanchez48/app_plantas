// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/utilities.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

/// TODO: add decription.
class RepositoryChat {
  HubConnection? _hubConnection;

  final _apiUrl =
      kIsWeb ? dotenv.env['API_URL_WEB']! : dotenv.env['API_URL_MOBILE']!;
  final _sendMessage = dotenv.env['METHOD_SENDMESSAGE']!;
  final _receiveMessage = dotenv.env['METHOD_RECEIVEMESSAGE']!;
  final _receiveMessageHistory = dotenv.env['METHOD_RECEIVEMESSAGEHISTORY']!;
  final _joinRoom = dotenv.env['METHOD_JOINROOM']!;

  Future<void> startConnection() async => methodCustom(
        callback: () async => await _hubConnection?.start(),
        onError: (e) => Future.delayed(
          const Duration(seconds: 5),
          () async => startConnection(),
        ),
      );

  Future<List<Mensaje>> configureSignalR() async {
    _hubConnection = HubConnectionBuilder().withUrl('${_apiUrl}chat').build();

    await _closeConnection();

    return receiveMessageHistory();
  }

  Future<List<Mensaje>> sendMessage(String message) async {
    var messages = <Mensaje>[];

    await methodCustom(
      callback: () async {
        final result = await _hubConnection?.invoke(
          _sendMessage,
          args: [message],
        );

        if (result != null) {
          messages = Mensaje.fromObjetListJson(result);
        }
      },
    );

    return messages;
  }

  Mensaje receiveMessage() {
    Mensaje? message;

    _hubConnection?.on(_receiveMessage, (listMessage) {
      if (listMessage != null) message = Mensaje.fromObjetJson(listMessage);
    });

    if (message == null) {
      return throw Exception('No messages found');
    }

    return message!;
  }

  List<Mensaje> receiveMessageHistory() {
    var messages = <Mensaje>[];

    _hubConnection?.on(_receiveMessageHistory, (messageHistory) {
      if (messageHistory != null) {
        messages = Mensaje.fromObjetListJson(messageHistory);
      }
    });

    return messages;
  }

  Future<void> joinRoom({
    required User usuario,
    required User userSend,
  }) async =>
      methodCustom(
        callback: () async => await _hubConnection?.invoke(
          _joinRoom,
          args: [
            JoinInRoom(
              room: '${usuario.id}-${userSend.id}',
              user: usuario,
            ).toJson(),
            JoinInRoom(
              room: '${usuario.id}-${userSend.id}',
              user: userSend,
            ).toJson(),
          ],
        ),
      );

  Future<void> _closeConnection() async =>
      _hubConnection?.onclose(({Exception? error}) async => startConnection());

  Future<void> stopConnection() async => methodCustom(
        callback: () async => await _hubConnection?.stop(),
      );
}

/// TODO: add decription.
class JoinInRoom {
  JoinInRoom({
    required this.user,
    required this.room,
  });

  User user;
  String room;
  Map<String, dynamic> toJson() => {
        'User': user.toJson(),
        'Room': room,
      };
}
