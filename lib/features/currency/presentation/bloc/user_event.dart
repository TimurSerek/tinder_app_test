part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class GetUsersEvent extends UserEvent {
  const GetUsersEvent();
}
