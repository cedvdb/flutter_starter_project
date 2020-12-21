import 'package:eureka_app/core/data/repositories/user_repository.dart';
import 'package:eureka_app/core/models/user.dart';
import 'package:eureka_app/core/state/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit({UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserUnset()) {
    _userRepository.user$.listen(_onUserChanged);
  }

  void _onUserChanged(User user) {
    emit(UserSet(user: user));
  }

  void setSelectedRestaurant(String userId, String restaurantId) {
    _userRepository.update(
      User(
        id: userId,
        restaurantSelected: restaurantId,
      ),
    );
  }

  void updateUser(User user) async {
    await _userRepository.update(user);
  }
}
