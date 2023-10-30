import 'package:dio/dio.dart';
import 'package:tinder_app_test/core/constants/constants.dart';
import 'package:tinder_app_test/core/resources/data_state.dart';
import 'package:tinder_app_test/features/currency/data/models/image_model.dart';
import 'package:tinder_app_test/features/currency/data/models/user_model.dart';

class UserApiService {
  Dio dio = Dio();

  Future<DataState<List<UserModel>>> getUsers() async {
    String url = '$jsonAPIBaseURL$usersAPIPath';
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        List<UserModel> users = [];
        response.data.forEach((e) {
          users.add(UserModel.fromJson(e));
        });
        return DataSuccess(users);
      } else {
        return DataFailed(DioException(
            error: response.statusMessage,
            response: response,
            type: DioExceptionType.badResponse,
            requestOptions: response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState<List<ImageModel>>> getAlbums() async {
    String url = '$jsonAPIBaseURL$photosAPIPath';
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        List<ImageModel> albums = [];
        response.data.forEach((e) {
          albums.add(ImageModel.fromJson(e));
        });

        return DataSuccess(albums);
      } else {
        return DataFailed(DioException(
            error: response.statusMessage,
            response: response,
            type: DioExceptionType.badResponse,
            requestOptions: response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
