import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:tinder_app_test/features/currency/data/data_sources/remote/user_api_service.dart';
import 'package:tinder_app_test/features/currency/data/repository/user_repository_impl.dart';
import 'package:tinder_app_test/features/currency/domain/repository/user_repository.dart';
import 'package:tinder_app_test/features/currency/domain/usecases/get_user_images.dart';
import 'package:tinder_app_test/features/currency/domain/usecases/get_users.dart';
import 'package:tinder_app_test/features/currency/presentation/bloc/user_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<UserApiService>(UserApiService());

  sl.registerSingleton<UserRepository>(
      UserRepositoryImpl(sl())
  );

  //UseCases
  sl.registerSingleton<GetUsersUseCase>(
      GetUsersUseCase(sl())
  );

  sl.registerSingleton<GetUserImagesUseCase>(
      GetUserImagesUseCase(sl())
  );

  //Blocs
  sl.registerFactory<UserBloc>(
          ()=> UserBloc(sl(), sl())
  );
}