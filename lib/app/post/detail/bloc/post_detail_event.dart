part of 'post_detail_bloc.dart';

sealed class PostDetailEvent extends Equatable {
  const PostDetailEvent();
}

class GetPostDetail extends PostDetailEvent {
  const GetPostDetail(this.id);

  final int id;

  @override
  List<Object?> get props => [id];
}
