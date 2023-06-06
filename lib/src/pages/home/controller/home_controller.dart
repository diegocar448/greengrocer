import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isLoading = false;
  List<CategoryModel> allCategories = [];

  // Aqui alteramos o estado de isLoading
  void setLoading(bool value) {
    isLoading = value;

    /** no getx sempre chamamos o update para atualizar
     * nesse exemplo com getBuilder
     */
    update();
  }

  @override
  onInit() {
    super.onInit();

    getAllCategories();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();

    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);
        print('Todas categorias: $allCategories');
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
