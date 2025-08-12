import 'package:flutter/material.dart';
import 'package:user_list_app/core/constants/dimens.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final VoidCallback? onTap;

  const UserCard({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginMedium, vertical: Dimensions.marginSmall),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
        onTap: onTap,
        child: Padding(
          padding:EdgeInsets.all(Dimensions.paddingMedium),
          child: Row(
            children: [
              CircleAvatar(
                radius: Dimensions.radiusLarge,
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : '?',
                  style: TextStyle(
                    fontSize: Dimensions.fontExtraLarge,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
               SizedBox(width: Dimensions.marginMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: Dimensions.fontLarge,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: Dimensions.fontMedium,
                        color: Colors.grey[700],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: Dimensions.fontMedium,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
               Icon(
                Icons.arrow_forward_ios,
                size: Dimensions.fontLarge,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
