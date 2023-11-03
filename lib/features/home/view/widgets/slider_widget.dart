import 'dart:async';

import 'package:fadingpageview/fadingpageview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/controller/home/home_cubit.dart';
import 'package:real_estate_task/features/home/controller/home/home_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late Timer _timer;
  late HomeCubit _homeCubit;
  final FadingPageViewController _pageController = FadingPageViewController();

  void _startPageView() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.currentPage < _homeCubit.sliderList.length-1) {
        _pageController.next();
      } else {
        _pageController.currentPage = 0;
      }
      _homeCubit.changeIndex(_pageController.currentPage);
    });
  }

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit.get(context);
    _startPageView();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: AppSize.heightScale(context, 95),
          decoration: const BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: EdgeInsets.symmetric(
            vertical: AppSize.heightScale(context, 8),
            horizontal: AppSize.widthScale(context, 12),
          ),
          child: FadingPageView(
            controller: _pageController,
            fadeInDuration: const Duration(milliseconds: 500),
            fadeOutDuration: const Duration(milliseconds: 500),
            itemBuilder: (context, itemIndex) {
              return _homeCubit.sliderList[itemIndex];
            },
          ),
        ),
        SizedBox(height: AppSize.heightScale(context, 8),),
        BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              return AnimatedSmoothIndicator(
                activeIndex: HomeCubit.get(context).index,
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
                count: 3,
                textDirection: TextDirection.rtl,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColor.primary,
                  dotColor: AppColor.darkGrey,
                  strokeWidth: 200,
                  expansionFactor: 2,
                  dotWidth: AppSize.widthScale(context, 8),
                  dotHeight: AppSize.widthScale(context, 8),
                ),
              );
            }
        ),
      ],
    );
  }
}
