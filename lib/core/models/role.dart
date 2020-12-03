class UserRole {
  final Role role;
  final String restaurant;

  UserRole(this.role, this.restaurant);
}

enum Role { owner, manager, employee }
