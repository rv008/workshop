import 'package:dio/dio.dart';
import 'package:workshop/app/post/list/model/post.dart';
import 'package:workshop/util/dio_client.dart';
import 'package:workshop/util/dio_exception.dart';

class GetPostService {
  Future<List<Post>> getPosts() async {
    try {
      final List<dynamic> response =
          await DioClient.instance.get(Paths.postUrl);
      final List<Post> posts =
          response.map((data) => Post.fromJson(data)).toList();
      return posts;
    } on DioException catch (e) {
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }
}
