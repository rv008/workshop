part of 'post_detail_bloc.dart';

sealed class PostDetailState extends Equatable {
  const PostDetailState();
}

///This is the loading state to show when an event starts
class PostDetailLoading extends PostDetailState {
  @override
  List<Object?> get props => [];
}

///This is the state to be shown when Post data has been gotten
class PostDetailLoaded extends PostDetailState {
  const PostDetailLoaded({this.post = const Post()});

  final Post post;
  @override
  List<Object?> get props => [post];
}

///This is the Error state
class PostDetailError extends PostDetailState {
  @override
  List<Object> get props => [];
}
