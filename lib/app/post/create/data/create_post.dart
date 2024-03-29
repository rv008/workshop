import 'package:dio/dio.dart';
import 'package:workshop/app/post/list/model/post.dart';
import 'package:workshop/util/dio_client.dart';
import 'package:workshop/util/dio_exception.dart';

class CreatePostService {
  Future<Post> createPost(String title, String body) async {
    try {
      final response = await DioClient.instance.post(Paths.postUrl, data: {
        "title": title,
        "body": body,
      });
      return Post.fromJson(response);
    } on DioException catch (e) {
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }
}
