import 'package:app/src/presentation/app_account/app_account.dart';
import 'package:app/src/presentation/app_chat/app_chat.dart';
import 'package:app/src/presentation/app_home/app_home.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../../theme/color_constants.dart';

// ignore: must_be_immutable
class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: AppColors.white,
          color: Colors.grey,
          activeColor: Colors.pink.withOpacity(0.8),
          initialActiveIndex: index,
          items: const [
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int i) => setState(() {
            index = i;
          }),
        ),
        backgroundColor: AppColors.white,
        body: Builder(
          builder: ((context) {
            switch (index) {
              case 0:
                return const AppChatScreen();
              case 1:
                return HomeScreen();
              case 2:
                return const AppAccountScreen();

              //  break;
              default:
                return const Center(child: Text('Screen not found'));
            }
          }),
        ));
  }
}
