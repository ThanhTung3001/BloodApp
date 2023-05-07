import 'package:app/src/presentation/app_blogs/controller/app_blog_controller.dart';
import 'package:get/get.dart';

class AppBlogBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppBlogController());
  }
}
