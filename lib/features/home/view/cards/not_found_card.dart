import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/app_image.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';

class NotFoundCard extends StatelessWidget {
  const NotFoundCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImage.order),
        Text(
            "No $title found",
            style: TextStyle(
              fontSize: AppSize.widthScale(context, 22),
              fontWeight: FontWeight.w700,
            ),
        ),
        SizedBox(
          height: AppSize.heightScale(context, 4),
        ),
        Text(
            "you can place your needed $title",
            style: TextStyle(
              fontSize: AppSize.widthScale(context, 18),
              fontWeight: FontWeight.w300,
              color: AppColor.darkGrey,
            ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
