import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String content;
  final bool receive;

  const Message({required this.content, required this.receive});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'],
      receive: json['receive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'receive': receive,
    };
  }

  @override
  List<Object?> get props => [content, receive];
}