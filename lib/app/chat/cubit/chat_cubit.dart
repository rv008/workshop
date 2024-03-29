import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/message.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial()) {
    getMessages();
  }
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://socketsbay.com/wss/v2/1/demo/'),
  );
  List<Message> messagesList = [];
  bool _isDisconnecting = false;

  void sendMessage(String message) async {
    try {
      emit(ChatInitial());
      channel.sink.add(message);
      messagesList.insert(0, Message(content: message, receive: false));

      emit(ChatSuccess(messagesList: messagesList));
    } catch (e) {}
  }

  void getMessages() {
    channel.stream.listen(
      (event) async {
        emit(ChatInitial());
        messagesList.insert(0, Message(content: event, receive: true));

        emit(ChatSuccess(messagesList: messagesList));
      },
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    );
  }

  void _onError(dynamic error) {
    if (!_isDisconnecting) {
      emit(ChatInitial());
      _reconnect();
    }
  }

  void _onDone() {
    if (!_isDisconnecting) {
      emit(ChatInitial());
      _reconnect();
    }
  }

  void _reconnect() {
    // Attempt reconnection logic
    Future.delayed(const Duration(seconds: 5), () {
      channel.sink.close();
      channel.sink.done.then((_) {
        _isDisconnecting = false;
        getMessages();
      });
    });
  }
}
