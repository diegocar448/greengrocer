import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils_services.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isCategoryLoading = false;
  bool isProductLoading = true;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;
  List<ItemModel> get allProducts => currentCategory?.items ?? [];

  //variavel observavel
  RxString searchTitle = ''.obs;

  bool get isLastPage {
    if (currentCategory!.items.length < itemsPerPage) {
      return true;
    }
    return currentCategory!.pagination * itemsPerPage > allProducts.length;
  }

  // Aqui alteramos o estado de isCategoryLoading
  void setLoading(bool value, {bool isProduct = false}) {
    if (isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    /** no getx sempre chamamos o update para atualizar
     * nesse exemplo com getBuilder
     */
    update();
  }

  // Aqui é o momento que iniciamos a nossa classe
  @override
  void onInit() {
    super.onInit();

    //delay de 600 mili. para evitar excesso de requisições
    debounce(
      searchTitle,
      (_) => filterByTitle(),
      time: const Duration(milliseconds: 600),
    );

    getAllCategories();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();

    if (currentCategory!.items.isNotEmpty) {
      return;
    }

    getAllProducts();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();

    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        if (allCategories.isEmpty) {
          return;
        }

        // recuperar categoria
        selectCategory(allCategories.first);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  // Codigo que vai pesquisar pelo titulo
  void filterByTitle() {
    // Apagar todos os produtos de categorias
    for (var category in allCategories) {
      category.items.clear();
      category.pagination = 0;
    }

    /** clicamos e removemos o primeiro item evitando duplicidade da categorias */
    if (searchTitle.value.isEmpty) {
      allCategories.removeAt(0);
    } else {
      /** verifica se a categoria Todos('') ja existe */
      /** Caso exista nao precisará criar novamente */
      CategoryModel? c = allCategories.firstWhereOrNull((cat) => cat.id == '');

      if (c == null) {
        // Criar uma nova categoria com todos
        final allProductsCategory = CategoryModel(
          title: 'Todos',
          id: '',
          items: [],
          pagination: 0,
        );

        allCategories.insert(0, allProductsCategory);
      } else {
        c.items.clear();
        c.pagination = 0;
      }
    }

    currentCategory = allCategories.first;
    update();

    //getAllCategories();
    getAllProducts();
  }

  // para paginar: (se for 1 então será 2, se for 3 então será 4)
  void loadMoreProducts() {
    currentCategory!.pagination++;

    getAllProducts(canLoad: false);
  }

  Future<void> getAllProducts({bool canLoad = true}) async {
    if (canLoad) {
      setLoading(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      'page': currentCategory!.pagination,
      'categoryId': currentCategory!.id,
      'itemsPerPage': itemsPerPage,
    };

    // Verificar antes se há algo digitado no campo de pesquisa
    if (searchTitle.value.isNotEmpty) {
      body['title'] = searchTitle.value;

      // se for null entao estamos usando a categoria todos
      if (currentCategory!.id == '') {
        body.remove('categoryId');
      }
    }

    HomeResult<ItemModel> result = await homeRepository.getAllProducts(body);

    setLoading(false, isProduct: true);

    result.when(
      success: (data) {
        /** setamos a lista de itens (addAll vai setar os itens restantes sem precisar carregar todos o items da lista do zero)*/
        currentCategory!.items.addAll(data);
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
