import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages_routes/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

import '../../../models/user_model.dart';

class AuthController extends GetxController {
  /* 
    sempre add .obs para poder tipar os tipos Rx
  */
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    // o retorno da api
    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        // ignore: avoid_print
        this.user = user;

        // Aqui ele remove todas views anteriores e rediciona para home
        Get.offAllNamed(PagesRoutes.baseRoute);
      },
      error: (message) {
        // aqui teremos a mensagem de erro ou nao, definido na propriedade isError
        // utilsServices.showToast(
        //   message: message,
        //   isError: true,
        // );

        // ignore: avoid_print
        print(message);
      },
    );
  }
}
