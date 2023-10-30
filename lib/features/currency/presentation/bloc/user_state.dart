part of 'user_bloc.dart';

abstract class UserState extends Equatable{
  final List<UserEntity>? users;
  final List<ImageEntity>? images;
  final DioException? error;

  const UserState({this.users, this.images, this.error});

  @override
  List<Object> get props => [users!, error!, images!];
}

class UsersLoadingState extends UserState{
  const UsersLoadingState();
}

class UsersDoneState extends UserState{
  const UsersDoneState(List<UserEntity> users, List<ImageEntity>? images) : super(users: users, images: images);
}

class UsersErrorState extends UserState{
  const UsersErrorState(DioException error) : super(error: error);
}

