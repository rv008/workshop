import 'package:equatable/equatable.dart';

class NewPost extends Equatable {
  final String? title;
  final String? body;

  const NewPost({this.title, this.body});

  factory NewPost.fromJson(Map<String, dynamic> json) {
    return NewPost(
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }

  @override
  List<Object?> get props => [title, body];
}
