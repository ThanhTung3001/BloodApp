import 'package:app/src/theme/color_constants.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget implements PreferredSizeWidget {
  const SearchWidget({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      elevation: 0,
      toolbarHeight: 80,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.gray.withOpacity(0.4),
        ),
        // color: AppColors.gray,
        height: 48,
        // margin: const EdgeInsets.all(0).copyWith(top: 16, bottom: 16),
        padding: const EdgeInsets.all(0),
        // width: Get.width - 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.red,
              width: 220,
              height: double.infinity,
              margin: const EdgeInsets.only(left: 16),
              child: const TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    // contentPadding: E,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // set border to none
                    ),
                    hintText: 'Type something...',
                    hintStyle:
                        TextStyle(color: AppColors.hintText) // add a hint text
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 4),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
                color: AppColors.pink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
