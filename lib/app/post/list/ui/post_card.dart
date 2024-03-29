
import 'package:flutter/material.dart';
import 'package:workshop/app/post/list/model/post.dart';

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