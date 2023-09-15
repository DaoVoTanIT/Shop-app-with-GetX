import 'package:cmms/common/model/product_model.dart';
import 'package:dio/dio.dart';

class CartRepository {
  Dio client;
  CartRepository({required this.client});
  Future<List<ProductModel>> getAllProduct() async {
    final response = await client.get('/products');
    var listProduct =
        (response.data as List).map((d) => ProductModel.fromJson(d)).toList();
    return listProduct;
  }
}
