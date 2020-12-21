import 'package:eureka_app/core/models/user.dart';

class UserState {}

class UserSet extends UserState {
  final User user;
  UserSet({this.user});
}

class UserUnset extends UserState {}
