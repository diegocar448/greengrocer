import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_key.dart';
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

  Future<void> validateToken() async {
    // pegar o token salvo localmente
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (user) {},
      error: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    // Zerar o user, deixando as variaveis como nullable
    user = UserModel();

    // Remover o token local
    await utilsServices.removeLocalData(key: StorageKeys.token);

    // Ir para o logijn
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  void saveTokenAndProccedToBase() {
    // Salvar token localmente
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    // Aqui ele remove todas views anteriores e rediciona para home
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

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

        // Aqui ele remove todas views anteriores,
        //  armazena o token e rediciona para home
        saveTokenAndProccedToBase();
        //Get.offAllNamed(PagesRoutes.baseRoute);
      },
      error: (message) {
        // aqui teremos a mensagem de erro ou nao, definido na propriedade isError
        utilsServices.showToast(
          message: message,
          isError: true,
        );

        // ignore: avoid_print
        print(message);
      },
    );
  }
}
