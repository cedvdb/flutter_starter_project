import 'package:eureka_app/core/models/restaurant.dart';
import 'package:eureka_app/core/models/role.dart';
import 'package:eureka_app/core/models/user.dart';

// auth
class AuthUser {
  final String id;
  final bool authenticated;
  AuthUser({this.id}) : authenticated = (id == null);
}

enum AuthProvider { google, phone }

abstract class AuthAPI {
  Stream<AuthUser> watchAuthUser();
  Future<void> signIn(AuthProvider provider);
  Future<void> signOut();
}

// data api
abstract class API<T> {
  Stream<T> watchOne(String id);
  Future<T> update(T t);
  Future<T> create(T t);
  Future<void> delete(T t);
}

abstract class UserAPI extends API<User> {}

abstract class RoleAPI extends API<UserRole> {
  Stream<List<UserRole>> watchUserRoles(String userId);
  Stream<List<UserRole>> watchRestaurantRoles(String restaurantId);
}

abstract class RestaurantAPI extends API<Restaurant> {
  Stream<List<Restaurant>> watchRestaurantList(List<String> restaurantsIds);
}
