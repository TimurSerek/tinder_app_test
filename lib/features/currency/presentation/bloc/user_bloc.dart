import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:tinder_app_test/core/resources/data_state.dart';
import 'package:tinder_app_test/features/currency/domain/entities/image.dart';
import 'package:tinder_app_test/features/currency/domain/usecases/get_user_images.dart';
import 'package:tinder_app_test/features/currency/domain/usecases/get_users.dart';

import '../../domain/entities/user.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase _getUsersUseCase;
  final GetUserImagesUseCase _getUserImagesUseCase;

  UserBloc(this._getUsersUseCase, this._getUserImagesUseCase) : super(const UsersLoadingState()) {
    on<GetUsersEvent>(onGetUsers);
  }

  void onGetUsers(GetUsersEvent event, Emitter<UserState> emit) async {
    final userDataState = await _getUsersUseCase();
    if (userDataState is DataSuccess && userDataState.data != null && userDataState.data!.isNotEmpty) {
      final imageDataState = await _getUserImagesUseCase();
      if (imageDataState is DataSuccess && imageDataState.data != null && imageDataState.data!.isNotEmpty) {
        emit(UsersDoneState(userDataState.data!, imageDataState.data!));
      }
    }

    if (userDataState is DataFailed && userDataState.error != null) {
      emit(UsersErrorState(userDataState.error!));
    }
  }
}
