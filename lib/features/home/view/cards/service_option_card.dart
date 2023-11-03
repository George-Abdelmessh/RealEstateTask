import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/shared_widgets/custom_button.dart';
import 'package:real_estate_task/core/style/app_color.dart';

class ServiceOptionCard extends StatelessWidget {
  const ServiceOptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.heightScale(context, 2),
        horizontal: AppSize.widthScale(context, 14),
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: AppColor.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              title: 'Categories',
              onTap: () {},
              background: AppColor.primary,
              textColor: AppColor.white,
              fontSize: AppSize.widthScale(context, 12.5),
              height: AppSize.heightScale(context, 20),
            ),
          ),
          SizedBox(width: AppSize.widthScale(context, 8),),
          Expanded(
            child: CustomButton(
              title: 'Services',
              onTap: () {},
              fontSize: AppSize.widthScale(context, 12.5),
              background: AppColor.grey,
              borderColor: AppColor.grey,
              textColor: AppColor.black,
              height: AppSize.heightScale(context, 20),
            ),
          ),
          SizedBox(width: AppSize.widthScale(context, 8),),
          Expanded(
            child: CustomButton(
              title: 'Orders (0)',
              onTap: () {},
              fontSize: AppSize.widthScale(context, 12.5),
              background: AppColor.grey,
              borderColor: AppColor.grey,
              textColor: AppColor.black,
              height: AppSize.heightScale(context, 20),
            ),
          ),
        ],
      ),
    );
  }
}
