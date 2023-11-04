import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/view/cards/app_bar_card.dart';
import 'package:real_estate_task/features/home/view/cards/bottom_nav_bar.dart';
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
      bottomNavigationBar: bottomNavigationBarDesign(),
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
                  /// User Welcome Card
                  const UserCard(),
                  SizedBox(
                    height: AppSize.heightScale(context, 16),
                  ),
                  /// Main Screen Info Widget
                  const InfoWidget(),
                  SizedBox(
                    height: AppSize.heightScale(context, 10),
                  ),
                  /// Slider Widget With Indicator
                  const SliderWidget(),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.heightScale(context, 3),
            ),
            /// Service Widget With 3 Views
            const ServiceWidget(),
          ],
        ),
      ),
    );
  }
}
