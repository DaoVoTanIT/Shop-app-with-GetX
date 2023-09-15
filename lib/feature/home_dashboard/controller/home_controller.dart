import 'package:cmms/common/model/product_model.dart';
import 'package:cmms/feature/home_dashboard/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class HomeController extends GetxController {
  RxList<ProductModel> listProduct = <ProductModel>[].obs;
  final listCategory = <String>[].obs;
  RxBool loading = false.obs;
  var showGrid = false.obs;
  RxInt indexCategory = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAllCategory();
    getAllProductByCategory('electronics');
    // getAllProduct();
  }

  Future<void> getAllProduct() async {
    loading(true);
    var repo = await GetIt.I.getAsync<HomeRepository>();
    listProduct.value = await repo.getAllProduct();
    loading(false);
  }

  Future<void> getAllProductByCategory(String category) async {
    loading(true);
    var repo = await GetIt.I.getAsync<HomeRepository>();
    listProduct.value = await repo.getAllProductByCategory(category);
    loading(false);
  }

  Future<void> getAllCategory() async {
    var repo = await GetIt.I.getAsync<HomeRepository>();
    listCategory.value = await repo.getAllCategory();
  }

  void isFavorite(int id) {
    var index = listProduct.indexWhere((p0) => p0.id == id);
    listProduct[index].isFavorite = !listProduct[index].isFavorite;
    update();
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }

  selectCategory(int index) {
    indexCategory.value = index;
  }
}
