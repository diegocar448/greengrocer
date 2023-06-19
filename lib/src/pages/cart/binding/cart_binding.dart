import 'package:get/get.dart';
import 'package:greengrocer/src/pages/cart/controller/cart_controller.dart';

class CartBinding extends Bindings {
  /// aqui vai injetar o nosso controller
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
