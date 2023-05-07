import 'package:app/src/data/api/blog_client/blog_client.dart';
import 'package:app/src/data/api/blog_client/blog_model.dart';
import 'package:get/get.dart';

class AppBlogController extends GetxController
    with StateMixin<ResponseBlogList> {
  Rx<int> pageIndex = 1.obs;

  handleChangePage() {
    var newPage = pageIndex.value + 1;
    pageIndex(newPage);
    initData();
  }

  initData() async {
    try {
      change(null, status: RxStatus.loading());
      var response = await BlogClient().getAllBlogs(page: pageIndex);
      if (state != null && state!.data != null && response.data != null) {
        state!.data!.addAll(response.data!);
        response.data = state!.data;
      }

      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initData();
    super.onInit();
  }
}
