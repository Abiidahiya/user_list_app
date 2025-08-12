import 'package:flutter/material.dart';
import 'package:user_list_app/features/users/presentation/widgets/user_card.dart';

import '../../data/models/user_model.dart';

class UserTile extends StatelessWidget {
  final UserModel user;

  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserCard(
      name: user.name,
      email: user.email,
      phone: user.phone,
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: user);
      },
    );
  }
}