part of 'create_post_bloc.dart';

sealed class CreatePostState extends Equatable {
  const CreatePostState();
}

final class CreatePostInitial extends CreatePostState {
  @override
  List<Object> get props => [];
}

class CreatePostLoading extends CreatePostState {
  @override
  List<Object> get props => [];
}

class CreatePostLoaded extends CreatePostState {
  const CreatePostLoaded({this.newPost = const Post()});

  final Post newPost;
  @override
  List<Object> get props => [newPost];
}
