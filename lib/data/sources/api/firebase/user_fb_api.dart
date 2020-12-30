import '_collections.dart';
import '_fb_api.dart';
import 'package:eureka_app/data/models/user.dart';
import '../api.dart';

class UserFbAPI extends FbAPI<User> implements UserAPI {
  UserFbAPI() : super(collection: Col.users);
}
