import 'package:flutter/material.dart';

import '../../../../core/constants/dimens.dart';
import '../../../../core/constants/string_constants.dart';
import '../../data/models/user_model.dart';
class UserDetailPage extends StatelessWidget{
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppStrings.emailLabel}${user.email}',
             style: TextStyle(fontSize: Dimensions.fontLarge,
             fontWeight: FontWeight.bold)),
            Text('${AppStrings.phoneLabel}${user.phone}',
                style: TextStyle(fontSize: Dimensions.fontMedium,
                    fontWeight: FontWeight.bold)),],
        ),
      ),

    );
  }

}