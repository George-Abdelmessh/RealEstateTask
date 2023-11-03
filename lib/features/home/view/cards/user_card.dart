import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/app_image.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImage.person,
          width: AppSize.widthScale(context, 30),
          height: AppSize.widthScale(context, 30),
        ),
        SizedBox(width: AppSize.widthScale(context, 6),),
        Text(
          "Hey, Ahmed",
          style: TextStyle(
            fontSize: AppSize.widthScale(context, 18),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: AppSize.widthScale(context, 6),),
        Image.asset(
          AppImage.emo,
          width: AppSize.widthScale(context, 30),
          height: AppSize.widthScale(context, 30),
        ),
      ],
    );
  }
}
