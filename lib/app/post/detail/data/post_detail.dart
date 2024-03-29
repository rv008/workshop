import 'package:dio/dio.dart';
import 'package:workshop/app/post/list/model/post.dart';
import 'package:workshop/util/dio_client.dart';
import 'package:workshop/util/dio_exception.dart';

class PostDetailService {
  Future<Post> getPostDetail(int id) async {
    try {
      final response = await DioClient.instance.get('${Paths.postUrl}/$id');
      return Post.fromJson(response);
    } on DioException catch (e) {
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }
}
