import 'package:get/get.dart';

class AuthController extends GetxController {
  /* 
    sempre add .obs para poder tipar os tipos Rx
  */
  RxBool isLoading = false.obs;

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    // mock delay
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
  }
}
