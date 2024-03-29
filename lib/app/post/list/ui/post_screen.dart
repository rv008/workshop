import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/app/chat/ui/chat.dart';
import 'package:workshop/app/post/create/ui/create_post.dart';
import 'package:workshop/app/post/detail/ui/post_detail.dart';
import 'package:workshop/app/post/list/bloc/get_post_bloc.dart';
import 'package:workshop/app/post/list/model/post.dart';

import 'post_card.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>  ChatScreen(),
            ),
          );
        },
        label: const Text('Chat'),
        icon: const Icon(Icons.chat_bubble_rounded),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreatePostScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('New'),
          )
        ],
      ),
      body: const PostListing(),
    );
  }
}

class PostListing extends StatelessWidget {
  const PostListing({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostBloc, GetPostState>(
      builder: (context, state) {
        switch (state) {
          case GetPostLoading():
            return const Center(child: CircularProgressIndicator());
          case GetPostLoaded():
            List<Post> posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                var post = posts[index];
                return PostCard(
                  post: post,
                  onSelect: (p0) => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PostDetailScreen(id: p0),
                    ),
                  ),
                );
              },
            );
          case GetPostError():
            return const Text('Something went wrong!');
        }
      },
    );
  }
}
