import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/view/cards/app_bar_card.dart';
import 'package:real_estate_task/features/home/view/widgets/info_widget.dart';
import 'package:real_estate_task/features/home/view/widgets/service_widget.dart';
import 'package:real_estate_task/features/home/view/widgets/slider_widget.dart';
import 'package:real_estate_task/features/home/view/cards/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDesign(),
      backgroundColor: AppColor.lightGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSize.heightScale(context, 10),
                horizontal: AppSize.widthScale(context, 20),
              ),
              child: Column(
                children: [
                  const UserCard(),
                  SizedBox(
                    height: AppSize.heightScale(context, 16),
                  ),
                  const InfoWidget(),
                  SizedBox(
                    height: AppSize.heightScale(context, 10),
                  ),
                  const SliderWidget(),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.heightScale(context, 3),
            ),
            const ServiceWidget(),
          ],
        ),
      ),
    );
  }
}
