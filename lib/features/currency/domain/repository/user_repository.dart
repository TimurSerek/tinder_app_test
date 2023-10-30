import 'package:tinder_app_test/core/resources/data_state.dart';
import 'package:tinder_app_test/features/currency/domain/entities/image.dart';
import 'package:tinder_app_test/features/currency/domain/entities/user.dart';

abstract class UserRepository{

  //API methods
  Future<DataState<List<UserEntity>>> getUsers();

  Future<DataState<List<ImageEntity>>> getImages();
}