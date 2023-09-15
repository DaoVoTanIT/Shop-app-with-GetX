import 'package:cmms/common/model/product_model.dart';
import 'package:dio/dio.dart';

class DetailProductRepository {
  Dio client;
  DetailProductRepository({required this.client});

  ////GetAll Wo by user
  Future<ProductModel> getDetailProduct(int id) async {
    final response = await client.get('/products/$id');
    var detail = ProductModel.fromJson(response.data);
    return detail;
  }

  Future<List<String>> getAllCategory() async {
    final response = await client.get('/products/categories');
    final List<String> categories =
        (response.data as List).map((item) => item.toString()).toList();

    return categories;
  }
}
