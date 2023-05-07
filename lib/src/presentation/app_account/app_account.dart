import 'package:app/src/presentation/app_auth/controller/app_auth_controller.dart';
import 'package:app/src/presentation/app_user/app_user_screen.dart';
import 'package:app/src/theme/color_constants.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:image_picker/image_picker.dart';
import '../../router/app_route.dart';
import 'app_account_bottom_sheet.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:intl/intl.dart';
import 'controllers/app_account_controller.dart';

class AppAccountScreen extends StatefulWidget {
  const AppAccountScreen({super.key});

  @override
  State<AppAccountScreen> createState() => _AppAccountScreenState();
}

class _AppAccountScreenState extends State<AppAccountScreen> {
  var controller = Get.put(AppAuthenController());

  var active = true;
  // var loading =
  final GFBottomSheetController _controller = GFBottomSheetController();

  Future<void> _handlerVerify() async {
    final ImagePicker picker = ImagePicker();

    _controller.isBottomSheetOpened
        ? _controller.hideBottomSheet()
        : _controller.showBottomSheet();
  }

  void setLoading() {
    if (context.loaderOverlay.visible) {
      context.loaderOverlay.hide();
    } else {
      context.loaderOverlay.show();
    }
  }
  // ignore: void_checks

  @override
  Widget build(BuildContext context) {
    var accountController =
        // ignore: void_checks
        Get.put(AppAccountController(handlerLoading: setLoading));
    var userInfo = controller.userInfo.value.data?.userInfo;
    return Scaffold(
      bottomSheet: BottomSheetAs(
        controller: _controller,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Account"),
      ),
      body: LoaderOverlay(
        child: ListView(
          children: [
            Obx(() {
              if (controller.auth.isTrue) {
                return Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  // height: 310,
                  child: Column(
                    children: [
                      Builder(builder: (context) {
                        print(userInfo?.iccid);
                        if (userInfo?.iccid == 0 || userInfo?.iccid == null) {
                          return Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.only(top: 32),
                                child: AppImageNetwork(
                                    url: userInfo?.avatar ?? "",
                                    borderRadius: BorderRadius.circular(48)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.all(8.0).copyWith(top: 16),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                    text: 'Email: ${userInfo?.email}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextSpan(
                                    text: 'FullName: ${userInfo?.fullName}\n',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ])),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16)
                                    .copyWith(top: 0, bottom: 0),
                                child: GFListTile(
                                  title: const Text(
                                    'Verify your information',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                  // description: const Text('This is menu item 1'),
                                  icon: const Icon(
                                    Icons.info_outline,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                  color: Colors.yellow,
                                  padding: const EdgeInsets.all(16),
                                  radius: 6,
                                  margin: const EdgeInsets.all(0),
                                  shadow: const BoxShadow(
                                    offset: Offset(0, 0),
                                    spreadRadius: -4,
                                    blurRadius: 5,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                  onTap: _handlerVerify,
                                ),
                              )
                            ],
                          );
                        }
                        // if(userInfo.data.)
                        return SizedBox(
                          child: CreditCardWidget(
                            isHolderNameVisible: true,
                            bankName: 'Blood Bank',
                            backgroundImage: './assets/images/17509086.jpg',
                            // glassmorphismConfig: Glassmorphism.defaultConfig(),
                            cardNumber: userInfo!.iccid!.toString(),
                            expiryDate: DateFormat("mm/yyyy").format(
                                DateTime.tryParse(userInfo.createUTC!)!),
                            obscureCardNumber: false,

                            isSwipeGestureEnabled: false,
                            cardHolderName: userInfo.fullName!,
                            cvvCode: "235",
                            showBackView: false,
                            onCreditCardWidgetChange: (data) {
                              //  print(data.brandName);
                            }, //true when you want to show cvv(back) view
                          ),
                        );
                      }),
                    ],
                  ),
                );
              }
              return SizedBox(
                height: 240,
                child: Column(
                  children: [
                    Container(
                      // height: 100,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 48, bottom: 48),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/images/logo.svg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      width: Get.width,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: (Get.width / 2 - 24),
                            child: GFButton(
                              color: AppColors.pink,
                              size: GFSize.LARGE,
                              onPressed: () {},
                              text: 'Sign Up',
                              fullWidthButton: true,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: (Get.width / 2 - 24),
                            child: GFButton(
                              type: GFButtonType.outline,
                              color: AppColors.pink,
                              size: GFSize.LARGE,
                              onPressed: () {
                                Get.toNamed(AppRoutes.signIn);
                              },
                              text: 'Sign In',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            Obx(
              () => controller.auth.isTrue
                  ? GFListTile(
                      title: const Text(
                        'Update your information',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                      // description: const Text('This is menu item 1'),
                      avatar: const Icon(
                        Icons.account_circle,
                        color: Colors.blueAccent,
                        size: 32,
                      ),

                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      radius: 6,
                      shadow: const BoxShadow(
                        offset: Offset(0, 0),
                        spreadRadius: -4,
                        blurRadius: 5,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      onTap: () {
                        Get.to(() => AppUserInfoUpdate());
                        // Xử lý khi người dùng nhấn vào menu item 1
                      },
                    )
                  : Container(),
            ),
            GFListTile(
              title: const Text(
                'Notification Register',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                    fontSize: 14),
              ),
              // description: const Text('This is menu item 1'),
              avatar: const Icon(
                Icons.notifications_active,
                color: Colors.blueAccent,
                size: 32,
              ),
              icon: Switch(
                value: active,
                onChanged: (value) => {
                  setState(() {
                    active = value;
                  })
                },
                focusColor: Colors.blueAccent,
                activeColor: Colors.blueAccent,
              ),
              color: Colors.white,
              padding: const EdgeInsets.all(8).copyWith(left: 16, right: 16),
              radius: 6,
              shadow: const BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: -4,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              onTap: () {
                // Xử lý khi người dùng nhấn vào menu item 1
              },
            ),
            GFListTile(
              title: const Text(
                'Support center',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                    fontSize: 14),
              ),
              description: const Text.rich(TextSpan(children: [
                TextSpan(
                  text: '08:00 - 22:00',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ),
                TextSpan(
                  text: ' (24/7)',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ])),
              avatar: const Icon(
                Icons.phone_in_talk_sharp,
                color: Colors.blueAccent,
                size: 32,
              ),
              color: Colors.white,
              padding: const EdgeInsets.all(16).copyWith(top: 16, bottom: 16),
              radius: 6,
              shadow: const BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: -4,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              onTap: () {
                // Xử lý khi người dùng nhấn vào menu item 1
              },
            ),
            GFListTile(
              title: const Text(
                'Review App',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              // description: const Text('This is menu item 1'),
              avatar: const Icon(
                Icons.message,
                color: Colors.blueAccent,
                size: 32,
              ),

              color: Colors.white,
              padding: const EdgeInsets.all(16),
              radius: 6,
              shadow: const BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: -4,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              onTap: () {
                // Xử lý khi người dùng nhấn vào menu item 1
              },
            ),
            GFListTile(
              title: const Text(
                'Application User Guide',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              // description: const Text('This is menu item 1'),
              avatar: const Icon(
                Icons.assignment,
                color: Colors.blueAccent,
                size: 32,
              ),

              color: Colors.white,
              padding: const EdgeInsets.all(16),
              radius: 6,
              shadow: const BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: -4,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              onTap: () {
                // Xử lý khi người dùng nhấn vào menu item 1
              },
            ),
            GFListTile(
              title: const Text(
                'History Donate',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              // description: const Text('This is menu item 1'),
              avatar: const Icon(
                Icons.history,
                color: Colors.blueAccent,
                size: 32,
              ),

              color: Colors.white,
              padding: const EdgeInsets.all(16),
              radius: 6,
              shadow: const BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: -4,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              onTap: () {
                Get.toNamed(AppRoutes.historyDonate);
                // Xử lý khi người dùng nhấn vào menu item 1
              },
            ),
            GFListTile(
              title: const Text(
                'Application Info',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              // description: const Text('This is menu item 1'),
              avatar: const Icon(
                Icons.info,
                color: Colors.blueAccent,
                size: 32,
              ),

              color: Colors.white,
              padding: const EdgeInsets.all(16),
              radius: 6,
              shadow: const BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: -4,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              onTap: () {
                // Xử lý khi người dùng nhấn vào menu item 1
              },
            ),
            GFListTile(
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              // description: const Text('This is menu item 1'),
              avatar: const Icon(
                Icons.logout,
                color: Colors.blueAccent,
                size: 32,
              ),

              color: Colors.white,
              padding: const EdgeInsets.all(16),
              radius: 6,
              shadow: const BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: -4,
                blurRadius: 5,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
              onTap: () {
                // Xử lý khi người dùng nhấn vào menu item 1
                controller.Logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
