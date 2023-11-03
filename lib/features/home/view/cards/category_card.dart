import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/app_image.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/modle/category/category_modle.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.date});

  final CategoryModel date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthScale(context, 10),
        horizontal: AppSize.widthScale(context, 16),
      ),
      decoration: const BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.grey,
            offset: Offset(0.0, 1), //(x,y)
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            date.icon,
            width: AppSize.widthScale(context, 25),
            height: AppSize.widthScale(context, 25),
          ),
          SizedBox(
            width: AppSize.widthScale(context, 8),
          ),
          Text(
              date.title,
              style: TextStyle(
                fontSize: AppSize.widthScale(context, 16),
                fontWeight: FontWeight.w400,
              )
          ),
          const Spacer(),
          SvgPicture.asset(
            AppImage.arrow,
            width: AppSize.widthScale(context, 25),
            height: AppSize.widthScale(context, 25),
          ),
        ],
      ),
    );
  }
}
