import 'package:eureka_app/data/models/user.dart';
import 'package:eureka_app/data/sources/repositories/user_repository.dart';
import 'package:eureka_app/data/state/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository = GetIt.I<UserRepository>();

  UserCubit() : super(UserState.unset()) {
    _userRepository.user$.listen(_onUserChanged);
  }

  void _onUserChanged(User user) {
    emit(UserState(user: user));
  }

  void setSelectedRestaurant(String restaurantId) {
    _userRepository.update(
      User(
        id: state.user.id,
        restaurantSelected: restaurantId,
      ),
    );
  }

  void updateUser(User user) async {
    await _userRepository.update(user);
  }
}
