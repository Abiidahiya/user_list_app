import 'app/app.dart';
import 'core/constants/api_constants.dart';
import 'core/network/api_client.dart';
import 'features/users/data/repositories/user_repository.dart';
import 'features/users/data/services/user_service.dart';
import 'package:flutter/material.dart';


void main() {
  final apiClient = ApiClient(baseUrl: ApiConstants.baseUrl);
  final userService = UserService(apiClient);
  final userRepository = UserRepository(userService);
  runApp(MyApp(userRepository: userRepository));
}