import 'package:tinder_app_test/core/resources/data_state.dart';
import 'package:tinder_app_test/features/currency/data/data_sources/remote/user_api_service.dart';
import 'package:tinder_app_test/features/currency/domain/entities/image.dart';
import 'package:tinder_app_test/features/currency/domain/entities/user.dart';
import 'package:tinder_app_test/features/currency/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  Future<DataState<List<ImageEntity>>> getImages() async {
    final response = await _userApiService.getAlbums();
    return response;
  }

  @override
  Future<DataState<List<UserEntity>>> getUsers() async {
    final response = await _userApiService.getUsers();
    return response;
  }
}
