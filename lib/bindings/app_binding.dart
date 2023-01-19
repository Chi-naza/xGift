// This customBindings injects our controllers and other things our app needs when it starts to run
// You can either extend or implement Bindings from the Gex Package
import 'package:get/get.dart';
import 'package:myapp/controllers/auth_controller.dart';
import 'package:myapp/controllers/top_up_controller.dart';

class GiftAppBindings implements Bindings {

  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(TopUpController());
  }

}