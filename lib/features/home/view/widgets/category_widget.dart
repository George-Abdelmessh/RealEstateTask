import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/app_image.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/modle/category/category_modle.dart';
import 'package:real_estate_task/features/home/view/cards/category_card.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  List<CategoryModel> categoryList = [
    CategoryModel(AppImage.cat1, 'Constructions'),
    CategoryModel(AppImage.cat2, 'Insurances'),
    CategoryModel(AppImage.cat4, 'Legal'),
    CategoryModel(AppImage.cat3, 'Buy & Sell'),
    CategoryModel(AppImage.cat5, 'Accounting Services'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Categories View",
                style: TextStyle(
                  fontSize: AppSize.widthScale(context, 16),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Text(
              "see all",
              style: TextStyle(
                fontSize: AppSize.widthScale(context, 14),
                color: AppColor.darkGrey,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AppSize.heightScale(context, 13),
        ),
        Expanded(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int i) {
              return CategoryCard(
                date: categoryList[i],
              );
            },
            separatorBuilder: (BuildContext context, int i) {
              return SizedBox(
                height: AppSize.widthScale(context, 10),
              );
            },
            itemCount: categoryList.length,
          ),
        ),
      ],
    );
  }
}
