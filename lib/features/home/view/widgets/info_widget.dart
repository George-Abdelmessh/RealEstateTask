import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Multi-Services for Your Real Estate Needs",
            style: TextStyle(
              fontSize: AppSize.widthScale(context, 17),
              fontWeight: FontWeight.w500,
            ),
        ),
        const SizedBox(height: 4,),
        Text(
            "Explore diverse real estate services for all your needs: property management, construction, insurance and more in one place.",
            style: TextStyle(
              fontSize: AppSize.widthScale(context, 14),
              fontWeight: FontWeight.w300,
              color: AppColor.darkGrey
            )
        )
      ],
    );
  }
}
