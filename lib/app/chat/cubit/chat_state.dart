part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {
  final List<Message> messagesList;
  const ChatSuccess({required this.messagesList});

  @override
  List<Object> get props => [messagesList];
}
