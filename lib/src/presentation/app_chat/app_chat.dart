import 'package:app/src/core/constant/app_base_url.dart';
import 'package:app/src/data/api/auth_client/auth_client.dart';
import 'package:app/src/data/api/auth_client/user_data_info.dart';
import 'package:app/src/presentation/app_auth/controller/app_auth_controller.dart';
import 'package:app/src/presentation/app_chat/controller/app_chat_controller.dart';
import 'package:app/src/theme/color_constants.dart';
import 'package:app/src/widgets/app_image_network.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class AppChatScreen extends StatefulWidget {
  const AppChatScreen({super.key});

  @override
  State<AppChatScreen> createState() => _AppChatScreenState();
}

class _AppChatScreenState extends State<AppChatScreen> {
  var controller = Get.put(AppAuthenController());
  final _chatController = Get.put(AppChatController());
  final GFBottomSheetController _controller = GFBottomSheetController();

  var loading = true;
  @override
  void initState() {
    super.initState();
    var userInfo = controller.userInfo.value.data;
    var userData = userInfo?.userInfo;
    ZIMKit()
        .connectUser(
            id: userInfo!.id.toString(),
            name: userData!.fullName!,
            avatarUrl: BASE_URL + userData.avatar!)
        .then((value) => {
              setState(() => {loading = false}),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GFBottomSheet(
        animationDuration: 300,
        controller: _controller,
        maxContentHeight: 400,
        stickyHeaderHeight: 100,
        contentBody: Container(
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: DropdownSearch<DataUserResponse>(
              asyncItems: (String search) async {
                var response = await AuthClient().getListUserInfo();

                return response.data!;
              },
              itemAsString: (item) => item.fullName!,
              dropdownDecoratorProps: const DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Search By Name",
                ),
              ),
              onChanged: (DataUserResponse? data) {
                _controller.isBottomSheetOpened
                    ? _controller.hideBottomSheet()
                    : _controller.showBottomSheet();
                Get.to(ZIMKitMessageListPage(
                  messageItemBuilder: (context, message, defaultWidget) {
                    return Theme(
                      data: ThemeData(
                        primaryColor: Colors.blue,
                      ),
                      child: Container(
                          width: Get.width,
                          padding: EdgeInsets.zero,
                          //  decoration: BoxDecoration(),
                          child: defaultWidget),
                    );
                  },
                  inputDecoration: const InputDecoration(
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Type message here...'),
                  appBarBuilder: (context, defaultAppBar) {
                    return AppBar(
                      backgroundColor: Colors.white,
                      titleSpacing: -40,
                      leading: SizedBox(
                        // width: 16,
                        child: IconButton(
                          onPressed: () {
                            print('back tapp');
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      leadingWidth: 50,
                      centerTitle: false,
                      title: Container(
                        child: GFListTile(
                          //color: Colors.red,
                          shadow: const BoxShadow(color: Colors.white),
                          avatar: SizedBox(
                              width: 40,
                              height: 40,
                              child: AppImageNetwork(
                                  url: data.avatar!,
                                  borderRadius: BorderRadius.circular(100))),
                          title: Text(
                            data.fullName!,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  conversationID: data!.appUserId!.toString(),
                  conversationType: ZIMConversationType.peer,
                ));
              },
            )),
        stickyFooterHeight: 50,
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                _controller.isBottomSheetOpened
                    ? _controller.hideBottomSheet()
                    : _controller.showBottomSheet();
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          )
        ],
        title: const Text(
          "Messenge",
        ),
        automaticallyImplyLeading: false,
      ),
      body: loading == true
          ? const Center(child: CircularProgressIndicator())
          : ZIMKitConversationListView(
              itemBuilder: (context, conversation, defaultWidget) {
                return InkWell(
                  onTap: () {
                    Get.to(ZIMKitMessageListPage(
                      messageItemBuilder: (context, message, defaultWidget) {
                        return Theme(
                          data: ThemeData(
                            primaryColor: Colors.blue,
                          ),
                          child: Container(
                              width: Get.width,
                              padding: EdgeInsets.zero,
                              //  decoration: BoxDecoration(),
                              child: defaultWidget),
                        );
                      },
                      inputDecoration: const InputDecoration(
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Type message here...'),
                      appBarBuilder: (context, defaultAppBar) {
                        return AppBar(
                          backgroundColor: Colors.white,
                          titleSpacing: -40,
                          leading: SizedBox(
                            // width: 16,
                            child: IconButton(
                              onPressed: () {
                                print('back tapp');
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          leadingWidth: 50,
                          centerTitle: false,
                          title: Container(
                            child: GFListTile(
                              //color: Colors.red,
                              shadow: const BoxShadow(color: Colors.white),
                              avatar: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: AppImageNetwork(
                                      url: conversation.avatarUrl,
                                      borderRadius:
                                          BorderRadius.circular(100))),
                              title: Text(
                                conversation.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      conversationID: conversation.id,
                      conversationType: conversation.type,
                    ));
                  },
                  child: GFListTile(
                    shadow: const BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.05, 0.05),
                      blurRadius: 1,
                    ),
                    color: Colors.white,
                    avatar: SizedBox(
                      width: 50,
                      height: 50,
                      child: AppImageNetwork(
                        url: conversation.avatarUrl,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    title: Text(
                      conversation.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    subTitle: Builder(builder: (builder) {
                      String type = '[file]';
                      if (conversation.lastMessage != null) {
                        if (conversation.lastMessage!.type ==
                            ZIMMessageType.image) {
                          type = '[image]';
                        } else if (conversation.lastMessage!.type ==
                            ZIMMessageType.file) {
                          type = '[file]';
                        } else if (conversation.lastMessage!.type ==
                            ZIMMessageType.audio) {
                          type = '[audio]';
                        } else if (conversation.lastMessage!.type ==
                            ZIMMessageType.text) {
                          type = conversation.lastMessage!.textContent!.text;
                        } else {
                          type = '[video]';
                        }
                        return Text(
                          type,
                          style: const TextStyle(color: AppColors.hintText),
                        );
                      }
                      return Container();
                    }),
                    icon: Text(
                      "${(DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(conversation.lastMessage!.info.timestamp)).inMinutes).toString()}m ago",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
