import 'package:app/src/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xffee4c83), Color(0xffe2e5f5)],
        stops: [0, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Stack(
        children: [
          Positioned.fill(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // color: Colors.white.withOpacity(0.8),
                ),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 36,
            left: 0,
            right: 0,
            child: Text(
              "By ChauDu@2023",
              style: TextStyle(
                color: AppColors.hintText,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    ));
  }
}
