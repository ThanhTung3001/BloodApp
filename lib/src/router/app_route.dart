import 'package:app/src/presentation/app_auth/app_auth.dart';
import 'package:app/src/presentation/app_blogs/app_blogs_screen.dart';
import 'package:app/src/presentation/app_event/app_event.dart';
import 'package:app/src/presentation/app_event/bindings/app_event_binding.dart';
import 'package:app/src/presentation/app_history_donate/binding/app_history_binding.dart';
import 'package:app/src/presentation/app_home/binding/home_binding.dart';
import 'package:app/src/presentation/app_registrations/app_registrations.dart';
import 'package:app/src/presentation/app_registrations/bindings/app_registration_binding.dart';
import 'package:app/src/presentation/app_splash/app_splash.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import '../presentation/app_blogs/bindings/app_blog_binding.dart';
import '../presentation/app_container/app_container.dart';
import '../presentation/app_history_donate/app_history_donate.dart';
import '../presentation/app_splash/bidings/app_splash_binding.dart';

class AppRoutes {
  static const String appHome = '/home';
  static const String appEvent = '/event';
  static const String splashApp = '/splash';
  static const String signIn = '/signIn';
  static const String bloodDonate = "/donate";
  static const String historyDonate = "/history";
  static const String blogs = "/blogs";
  //List App Routes

  static List<GetPage> pages = [
    GetPage(
      name: appHome,
      page: () => const AppContainer(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: appEvent,
      page: () => AppEventScreen(),
      bindings: [
        AppEventBinding(),
      ],
    ),
    GetPage(
      name: splashApp,
      page: () => const AppSplashScreen(),
      bindings: [
        AppSplashBinding(),
      ],
    ),
    GetPage(
      name: signIn,
      page: () => AuthScreen(),
      bindings: const [
        // ApPAut(),
      ],
    ),
    GetPage(
      name: bloodDonate,
      page: () => AppDonateScreen(),
      bindings: [
        // ApPAut(),
        AppRegistrationBinding()
      ],
    ), //AppHistoryDonateScreen
    GetPage(
      name: historyDonate,
      page: () => AppHistoryDonateScreen(),
      bindings: [
        // ApPAut(),
        AppHistoryBinding()
      ],
    ),
    GetPage(
      name: blogs,
      page: () => AppBlogScreen(),
      bindings: [
        // ApPAut(),
        AppBlogBinding()
      ],
    ), // //
  ];
}//AppBlogScreen
