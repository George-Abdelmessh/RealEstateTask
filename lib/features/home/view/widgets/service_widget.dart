import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/view/cards/service_option_card.dart';
import 'package:real_estate_task/features/home/view/widgets/category_widget.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      width: double.infinity,
      height: AppSize.heightScale(context, 250),
      padding: EdgeInsets.symmetric(
        vertical: AppSize.widthScale(context, 16),
        horizontal: AppSize.widthScale(context, 20),
      ),
      child: Column(
        children: [
          const ServiceOptionCard(),
          SizedBox(
            height: AppSize.heightScale(context, 13),
          ),
          const Expanded(child: CategoryWidget())
        ],
      ),
    );
  }
}
