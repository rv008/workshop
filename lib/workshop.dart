import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshop/app/chat/cubit/chat_cubit.dart';
import 'package:workshop/app/post/list/bloc/get_post_bloc.dart';
import 'package:workshop/app/post/list/data/get_post.dart';
import 'package:workshop/app/post/list/ui/post_screen.dart';

class WorkshopApp extends StatelessWidget {
  const WorkshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetPostBloc(GetPostService())..add(GetPost()),
        ),
        BlocProvider(
          create: (_) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const PostScreen(),
      ),
    );
  }
}
