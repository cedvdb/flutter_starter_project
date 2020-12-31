import 'package:eureka_app/data/models/user.dart';

class UserState {}

class UserSet extends UserState {
  final User user;
  UserSet({this.user});

  @override
  String toString() => 'UserSet(user: $user)';
}

class UserUnset extends UserState {}
