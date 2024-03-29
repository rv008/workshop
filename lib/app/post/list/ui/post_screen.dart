import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/app/post/create/ui/create_post.dart';
import 'package:workshop/app/post/detail/ui/post_detail.dart';
import 'package:workshop/app/post/list/bloc/get_post_bloc.dart';
import 'package:workshop/app/post/list/model/post.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post, required this.onSelect});

  final Post post;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: InkWell(
        onTap: () => onSelect(post.id!),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        height: 30,
                        width: 30,
                        color: Theme.of(context).colorScheme.secondary,
                        alignment: Alignment.center,
                        child: Text(
                          '${post.userId}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${post.title}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // const SizedBox(height: 20),
              // Text(
              //   '${post.body}',
              //   textAlign: TextAlign.start,
              //   style: const TextStyle(fontSize: 12),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
