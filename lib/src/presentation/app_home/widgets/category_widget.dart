import 'package:app/src/presentation/app_category/app_category.dart';
import 'package:app/src/router/app_route.dart';
import 'package:app/src/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16).copyWith(top: 4),
      width: Get.width,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.bloodDonate);
            },
            child: CategoryItem(
                icon: const Icon(
                  Icons.bloodtype,
                  color: AppColors.white,
                  size: 32,
                ),
                text: 'Donate',
                boxColor: Colors.pink.withOpacity(0.8)),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.appEvent);
            },
            child: CategoryItem(
              icon: const Icon(
                Icons.event,
                color: AppColors.white,
                size: 32,
              ),
              text: 'Event',
              boxColor: Colors.green,
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.blogs);
            },
            child: CategoryItem(
              icon: const Icon(
                Icons.newspaper,
                color: AppColors.white,
                size: 32,
              ),
              text: 'Blog',
              boxColor: Colors.grey,
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => AppCategory());
            },
            child: CategoryItem(
                icon: const Icon(
                  Icons.widgets,
                  color: AppColors.white,
                  size: 32,
                ),
                text: 'View all',
                boxColor: Colors.black),
          ),
        ],
      ),
    );
  }
}

Widget CategoryItem(
    {Icon? icon,
    required String text,
    // Function()? onTap,
    Color? boxColor = AppColors.pink}) {
  return SizedBox(
    // height: ,
    child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: icon),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            text,
            style: const TextStyle(
                color: AppColors.hintText, fontWeight: FontWeight.w500),
          ),
        )
      ],
    ),
  );
}
