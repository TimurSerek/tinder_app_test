import 'package:tinder_app_test/core/resources/data_state.dart';
import 'package:tinder_app_test/core/usecases/usecase.dart';
import 'package:tinder_app_test/features/currency/domain/entities/user.dart';
import 'package:tinder_app_test/features/currency/domain/repository/user_repository.dart';

class GetUsersUseCase implements UseCase<DataState<List<UserEntity>>, void> {
  final UserRepository _userRepository;

  GetUsersUseCase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({void params}) {
    return _userRepository.getUsers();
  }
}