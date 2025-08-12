
import 'package:user_list_app/features/users/data/models/user_model.dart';

import '../services/user_service.dart';

class UserRepository {
  final UserService userService;

  UserRepository(this.userService);

  Future<List<UserModel>> fetchUsers() async {
    try {
      final users = await userService.getUsers();
      if (users.isEmpty) {
        throw Exception('No users found');
      }
      return users;
    } catch (e) {
      throw Exception('UserRepository fetchUsers failed: $e');
    }
  }
}