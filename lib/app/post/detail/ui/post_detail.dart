import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/app/post/detail/bloc/post_detail_bloc.dart';
import 'package:workshop/app/post/detail/data/post_detail.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            PostDetailBloc(PostDetailService())..add(GetPostDetail(id)),
        child: const PostDetail(),
      ),
    );
  }
}

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailBloc, PostDetailState>(
      builder: (context, state) {
        switch (state) {
          case PostDetailLoading():
            return const Center(child: CircularProgressIndicator());
          case PostDetailLoaded():
            var post = state.post;
            return Scaffold(
              appBar: AppBar(
                title: Text('${post.title}'),
              ),
              body: ListView(
                padding: const EdgeInsets.all(20.0),
                children: [Text('${post.body}')],
              ),
            );
          case PostDetailError():
            return const Text('Something went wrong!');
        }
      },
    );
  }
}
