part of 'get_post_bloc.dart';

sealed class GetPostState extends Equatable {
  const GetPostState();
}

///This is the loading state to show when an event starts
class GetPostLoading extends GetPostState {
  @override
  List<Object?> get props => [];
}

///This is the state to be shown when Post data has been gotten
class GetPostLoaded extends GetPostState {
  const GetPostLoaded({this.posts = const []});

  final List<Post> posts;
  @override
  List<Object?> get props => [posts];
}

///This is the Error state
class GetPostError extends GetPostState {
  @override
  List<Object> get props => [];
}
