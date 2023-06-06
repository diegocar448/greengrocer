import 'package:get/get.dart';
import 'package:greengrocer/src/pages/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // aqui ele vai injetar a HomeController
    //sempre que a baseScreen for aberta
    Get.put(HomeController());
  }
}
