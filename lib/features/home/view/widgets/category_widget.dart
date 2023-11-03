import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';
import 'package:real_estate_task/features/home/controller/user/user_cubit.dart';
import 'package:real_estate_task/features/home/controller/user/user_states.dart';
import 'package:real_estate_task/features/home/view/cards/category_card.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  

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
        BlocBuilder<UserDataCubit, UserStates>(
          builder: (context, state) {
            if (state is LoadingUserDataState) {
              return const Center(child: CircularProgressIndicator(
                color: AppColor.primary,
              ),);
            } else if(state is SuccessUserDataState) {
              return Expanded(
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    return UserDataCard(
                      date: state.result[i],
                    );
                  },
                  separatorBuilder: (BuildContext context, int i) {
                    return SizedBox(
                      height: AppSize.widthScale(context, 10),
                    );
                  },
                  itemCount: state.result.length,
                ),
              );
            } else if (state is ErrorUserDataState) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(
                    fontSize: AppSize.widthScale(context, 22),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }else {
              return Center(
                child: Text(
                  "Not found",
                  style: TextStyle(
                    fontSize: AppSize.widthScale(context, 22),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }
          }
        ),
      ],
    );
  }
}
