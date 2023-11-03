import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/shared_widgets/custom_button.dart';
import 'package:real_estate_task/core/style/app_color.dart';

class SliderContentCard extends StatelessWidget {
  const SliderContentCard({
    super.key,
    required this.title,
    required this.content,
    required this.image,
    required this.btnTitle,
  });

  final String title;
  final String content;
  final String btnTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppSize.widthScale(context, 170),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: AppSize.widthScale(context, 16),
                  fontWeight: FontWeight.w500,
                ),
              ),
              if(content != '')
              const SizedBox(
                height: 4,
              ),
              if(content != '')
              Text(
                content,
                style: TextStyle(
                  fontSize: AppSize.widthScale(context, 12),
                  color: AppColor.darkGrey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: AppSize.widthScale(context, 130),
                child: CustomButton(
                  title: btnTitle,
                  onTap: () {},
                  height: AppSize.heightScale(context, 20),
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          image,
          width: AppSize.widthScale(context, 140),
        )
      ],
    );
  }
}
