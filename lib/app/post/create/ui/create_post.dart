import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/app/post/create/bloc/create_post_bloc.dart';
import 'package:workshop/app/post/create/data/create_post.dart';
import 'package:workshop/app/post/list/bloc/get_post_bloc.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      body: BlocProvider(
        create: (_) => CreatePostBloc(CreatePostService()),
        child: const CreatePostForm(),
      ),
    );
  }
}

class CreatePostForm extends StatefulWidget {
  const CreatePostForm({super.key});

  @override
  State<CreatePostForm> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostLoaded?) {
          context.read<GetPostBloc>().add(GetPost());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("New Post Created"),
            ),
          );
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              "POST",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter title'),
              controller: titleController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(hintText: 'Enter body'),
              controller: bodyController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                if (titleController.text.trim().isEmpty ||
                    bodyController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid Data!"),
                    ),
                  );
                  return;
                }
                context
                    .read<CreatePostBloc>()
                    .add(CreatePost(titleController.text, bodyController.text));
              },
              child: state is CreatePostLoaded? || state is CreatePostInitial
                  ? const Text(
                      "Create Post",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                  : const CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }
}
