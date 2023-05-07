import 'dart:async';
import 'package:app/src/presentation/app_map/controller/app_map_controller.dart';
import 'package:app/src/presentation/app_registrations/controller/app_registrations_controller.dart';
import 'package:app/src/router/app_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:url_launcher/url_launcher.dart';

class AppMapScreen extends StatefulWidget {
  const AppMapScreen({super.key});

  @override
  State<AppMapScreen> createState() => AppMapScreenState();
}

class AppMapScreenState extends State<AppMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  var controller = Get.put(AppMapController());

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(16.4624435, 107.5853834),
    zoom: 16.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  late GoogleMapController _mapController;
  Future<void> _launchMaps(double latitude, double longitude) async {
    var urlPath = 'https://www.google.com/maps?q=$latitude,$longitude';
    print(urlPath);
    var url = Uri.parse(urlPath);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Map Hospital",
        ),
      ),
      body: controller.obx((state) => Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    _mapController = controller;
                  },
                  myLocationEnabled: false,
                  markers: controller.markers.value,
                ),
              ),
              Positioned(
                  bottom: 20,
                  child: SizedBox(
                    // color: Colors.amber,
                    height: 90,
                    width: Get.width,
                    child: CarouselSlider(
                        items: state!.data!
                            .map((e) => InkWell(
                                  onTap: () {
                                    Get.bottomSheet(
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          height: 200,
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                e.name!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  height: 2,
                                                ),
                                              ),
                                              Text(
                                                e.address!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(e.phoneNumber!),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(30)
                                                        .copyWith(
                                                            top: 16,
                                                            bottom: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    GFButton(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        top: 8,
                                                        bottom: 8,
                                                      ),
                                                      size: GFSize.LARGE,
                                                      onPressed: () {
                                                        _launchMaps(
                                                            double.parse(e.lat
                                                                .toString()),
                                                            double.parse(e.long
                                                                .toString()));
                                                      },
                                                      text: "Go to hospital",
                                                    ),
                                                    GFButton(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 16,
                                                        right: 16,
                                                        top: 8,
                                                        bottom: 8,
                                                      ),
                                                      size: GFSize.LARGE,
                                                      onPressed: () {
                                                        //* controller.hospitalController.value.text */
                                                        var ctl = Get.put(
                                                            AppRegistrationController());
                                                        ctl
                                                            .hospitalController
                                                            .value
                                                            .text = e.name!;
                                                        Get.toNamed(AppRoutes
                                                            .bloodDonate);
                                                      },
                                                      text: "Donate blood",
                                                      color: Colors.pink,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        backgroundColor: Colors.white);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(1, 5),
                                          spreadRadius: -6,
                                          blurRadius: 16,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                        )
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          e.name!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          e.address!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(e.phoneNumber!)
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          // height: 400,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          // enableInfiniteScroll: true,
                          reverse: false,
                          // autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,

                          onPageChanged: (page, reason) {
                            var data = state.data![page];
                            _mapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(
                                      double.parse(data.lat.toString()),
                                      double.parse(data.long
                                          .toString())), // San Francisco, for example
                                  zoom: 16.4746,
                                ),
                              ),
                            );
                          },
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        )),
                  )),
              Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    color: Colors.white,
                    // height: 80,
                    width: Get.width,
                    child: DropdownSearch<String>(
                      // mode: Mode.MENU,
                      // showSearchBox: true,
                      // selectedItem: 'Apple',
                      items: state.data!.map((e) => e.name.toString()).toList(),
                      onChanged: (value) {
                        var data =
                            state.data!.where((e) => e.name == value).first;
                        _mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                  double.parse(data.lat.toString()),
                                  double.parse(data.long
                                      .toString())), // San Francisco, for example
                              zoom: 16.4746,
                            ),
                          ),
                        );
                      },
                    ),
                  ))
            ],
          )),
    );
  }
}
