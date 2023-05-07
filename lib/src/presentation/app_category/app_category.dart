import 'package:app/src/presentation/app_auth/controller/app_auth_controller.dart';
import 'package:app/src/presentation/app_category/app_registration_employee.dart';
import 'package:app/src/presentation/app_category/app_scanner_register.dart';
import 'package:app/src/presentation/app_home/widgets/category_widget.dart';
import 'package:app/src/presentation/app_map/app_map.dart';
import 'package:app/src/router/app_route.dart';
import 'package:app/src/theme/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppCategory extends StatelessWidget {
  AppCategory({super.key});
  var controller = Get.put(AppAuthenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Extensions"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        height: Get.height,
        child: GridView.count(
          crossAxisCount: 4, // number of columns
          childAspectRatio: 0.8, // width / height ratio of each cell
          mainAxisSpacing: 10.0, // space between cells vertically
          crossAxisSpacing: 10.0,
          padding: const EdgeInsets.all(10.0),
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.bloodDonate);
              },
              child: Container(
                child: CategoryItem(
                    icon: const Icon(
                      Icons.bloodtype,
                      color: AppColors.white,
                      size: 32,
                    ),
                    text: 'Donate',
                    boxColor: Colors.pink.withOpacity(0.8)),
              ),
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
                Get.to(() => const AppMapScreen());
              },
              child: CategoryItem(
                  icon: const Icon(
                    Icons.location_on,
                    color: AppColors.white,
                    size: 32,
                  ),
                  text: 'Map',
                  boxColor: Colors.black),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AppScannerRegister());
              },
              child: CategoryItem(
                icon: const Icon(
                  Icons.qr_code_2_outlined,
                  color: AppColors.white,
                  size: 32,
                ),
                text: 'Qr scan',
                boxColor: Colors.blueGrey,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => AppCategory());
              },
              child: CategoryItem(
                icon: const Icon(
                  Icons.report,
                  color: AppColors.white,
                  size: 32,
                ),
                text: 'Report',
                boxColor: Colors.redAccent,
              ),
            ),
            Builder(builder: (context) {
              // ignore: unnecessary_null_comparison
              print(controller.hospitalResponse.value.id);
              if (controller.hospitalResponse.value.id == null) {
                return InkWell(
                  onTap: () {
                    Get.to(() => RegistrationsEmployee());
                  },
                  child: CategoryItem(
                    icon: const Icon(
                      Icons.star,
                      color: AppColors.white,
                      size: 32,
                    ),
                    text: 'Point',
                    boxColor: Colors.blue,
                  ),
                ); //accumulation
              }
              return InkWell(
                onTap: () {
                  Get.to(() => RegistrationsEmployee());
                },
                child: CategoryItem(
                  icon: const Icon(
                    Icons.app_registration,
                    color: AppColors.white,
                    size: 32,
                  ),
                  text: 'Registrations',
                  boxColor: Colors.blue,
                ),
              );
            }),
            InkWell(
              onTap: () {
                Get.to(() => AppCategory());
              },
              child: CategoryItem(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 32,
                ),
                text: 'New Feature',
                boxColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
