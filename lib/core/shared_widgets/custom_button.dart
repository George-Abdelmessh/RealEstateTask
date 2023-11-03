import 'package:flutter/material.dart';
import 'package:real_estate_task/core/constant/screen_size.dart';
import 'package:real_estate_task/core/style/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.textColor = AppColor.white,
    this.background = AppColor.primary,
    this.borderColor = AppColor.primary,
    this.loadingColor = AppColor.white,
    this.fontWeight = FontWeight.w600,
    this.fontSize,
  });

  final String title;
  final double? height;
  final bool isLoading;
  final Function() onTap;
  final Color textColor;
  final Color background;
  final Color borderColor;
  final Color loadingColor;
  final FontWeight fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? AppSize.heightScale(context, 30),
      onPressed: onTap,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        side: BorderSide(color: borderColor),
      ),
      elevation: 0.0,
      focusElevation: 0.0,
      hoverElevation: 0.0,
      highlightElevation: 0.0,
      color: background,
      focusColor: background,
      hoverColor: background,
      splashColor: background,
      highlightColor: background,
      textColor: textColor,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize?? AppSize.widthScale(context, 17),
            fontWeight: fontWeight
        ),
      ),
    );
  }
}
