import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/controller/home/home_cubit.dart';
import 'package:real_estate_task/features/home/controller/user/user_cubit.dart';
import 'package:real_estate_task/features/home/data/user_data.dart';
import 'package:real_estate_task/features/home/view/cards/not_found_card.dart';
import 'package:real_estate_task/features/home/view/cards/service_option_card.dart';
import 'package:real_estate_task/features/home/view/widgets/category_widget.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  List<Widget> viewWidget = [
    const CategoryWidget(),
    const NotFoundCard(title: 'service',),
    const NotFoundCard(title: 'order',),
  ];

  @override
  void initState() {
    super.initState();
    UserDataCubit.get(context).getUserData(UserData());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      height: AppSize.heightScale(context, 240),
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
          Expanded(
            child: PageView(
              controller: HomeCubit.get(context).pageController,
              children: viewWidget,
            ),
          )
        ],
      ),
    );
  }
}
