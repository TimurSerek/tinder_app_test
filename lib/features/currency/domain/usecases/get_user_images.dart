import 'package:tinder_app_test/core/resources/data_state.dart';
import 'package:tinder_app_test/core/usecases/usecase.dart';
import 'package:tinder_app_test/features/currency/domain/entities/image.dart';
import 'package:tinder_app_test/features/currency/domain/repository/user_repository.dart';

class GetUserImagesUseCase
    implements UseCase<DataState<List<ImageEntity>>, int> {
  final UserRepository _userRepository;

  GetUserImagesUseCase(this._userRepository);

  @override
  Future<DataState<List<ImageEntity>>> call({void params}) {
    return _userRepository.getImages();
  }
}
