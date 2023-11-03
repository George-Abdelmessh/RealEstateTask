import 'package:flutter/material.dart';
import 'package:real_estate_task/core/style/app_color.dart';

PreferredSizeWidget appBarDesign() {
  return AppBar(
    leading: const Icon(Icons.menu, color: AppColor.black,),
    backgroundColor: AppColor.white,
    elevation: 0.8,
    title: const Text(
      'Home',
      style: TextStyle(
          color: AppColor.black
      ),
    ),
  );
}