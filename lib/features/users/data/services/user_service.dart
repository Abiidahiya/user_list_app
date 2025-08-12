
import 'package:user_list_app/features/users/data/models/user_model.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';

class UserService {
  final ApiClient apiClient;

  UserService(this.apiClient);

  Future<List<UserModel>> getUsers() async {
    try {
      final data = await apiClient.get(ApiConstants.usersEndpoint);
      if (data == null) {
        throw Exception('No data received from API');
      }
      return (data as List).map((json) => UserModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('UserService getUsers failed: $e');
    }
  }
}