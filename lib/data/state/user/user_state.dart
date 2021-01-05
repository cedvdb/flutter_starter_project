import 'package:eureka_app/data/models/user.dart';

enum Status { set, unset }

class UserState {
  final User user;
  final Status status;
  UserState({this.user}) : status = user != null ? Status.set : Status.unset;

  UserState.unset()
      : user = null,
        status = Status.unset;

  @override
  String toString() => 'UserState(user: $user, status: $status)';
}
