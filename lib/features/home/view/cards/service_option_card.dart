import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/shared_widgets/custom_button.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/controller/home_cubit.dart';
import 'package:real_estate_task/features/home/controller/home_states.dart';

class ServiceOptionCard extends StatefulWidget {
  const ServiceOptionCard({super.key});

  @override
  State<ServiceOptionCard> createState() => _ServiceOptionCardState();
}

class _ServiceOptionCardState extends State<ServiceOptionCard> {
  late HomeCubit _homeCubit;
  late int _select;

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        _select = _homeCubit.selectedView;
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
                  onTap: () => _homeCubit.changeView(0),
                  background: _select == 0? AppColor.primary : AppColor.grey,
                  borderColor: _select == 0? AppColor.primary : AppColor.grey,
                  textColor: _select == 0? AppColor.white : AppColor.black,
                  fontSize: AppSize.widthScale(context, 12.5),
                  height: AppSize.heightScale(context, 20),
                ),
              ),
              SizedBox(width: AppSize.widthScale(context, 8),),
              Expanded(
                child: CustomButton(
                  title: 'Services',
                  onTap: () => _homeCubit.changeView(1),
                  fontSize: AppSize.widthScale(context, 12.5),
                  background: _select == 1? AppColor.primary : AppColor.grey,
                  borderColor: _select == 1? AppColor.primary : AppColor.grey,
                  textColor: _select == 1? AppColor.white : AppColor.black,
                  height: AppSize.heightScale(context, 20),
                ),
              ),
              SizedBox(width: AppSize.widthScale(context, 8),),
              Expanded(
                child: CustomButton(
                  title: 'Orders (0)',
                  onTap: () => _homeCubit.changeView(2),
                  fontSize: AppSize.widthScale(context, 12.5),
                  background: _select == 2? AppColor.primary : AppColor.grey,
                  borderColor: _select == 2? AppColor.primary : AppColor.grey,
                  textColor: _select == 2? AppColor.white : AppColor.black,
                  height: AppSize.heightScale(context, 20),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
