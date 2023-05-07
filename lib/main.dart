import 'package:app/src/core/utils/initial_bindings.dart';
import 'package:app/src/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zego_zimkit/services/services.dart';
import 'firebase_options.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  await Firebase.initializeApp(
    name: "BankBlood",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ZIMKit().init(
    appID: 1061331574, // your appid
    appSign:
        "f1003b4750e3df092aa5c2864937f501a4ad587d9a2cda70b23b7813d3139186", // your appSign
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      title: 'BankBlood',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.splashApp,
      getPages: AppRoutes.pages,
      // home: const AuthScreen(),
    );
  }
}
