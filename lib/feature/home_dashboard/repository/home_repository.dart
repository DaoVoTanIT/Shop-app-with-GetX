import 'package:cmms/common/model/product_model.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  Dio client;
  HomeRepository({required this.client});

  ////GetAll Wo by user
  Future<List<ProductModel>> getAllProduct() async {
    final response = await client.get('/products');
    var listProduct =
        (response.data as List).map((d) => ProductModel.fromJson(d)).toList();
    return listProduct;
  }

  Future<List<ProductModel>> getAllProductByCategory(String category) async {
    final response = await client.get('/products/category/$category');
    var listProduct =
        (response.data as List).map((d) => ProductModel.fromJson(d)).toList();
    return listProduct;
  }

  Future<List<String>> getAllCategory() async {
    final response = await client.get('/products/categories');
    final List<String> categories =
        (response.data as List).map((item) => item.toString()).toList();

    return categories;
  }
}
