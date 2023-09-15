import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/product_model.dart';
import 'package:cmms/feature/product_detail/repository/product_detail_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class DetailProductController extends GetxController {
  Rx<ProductModel> detailProduct = ProductModel().obs;
  RxBool loading = false.obs;
  RxInt count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    count = 0.obs;
  }

  Future<void> getDetailProduct(int id) async {
    loading(true);
    var repo = await GetIt.I.getAsync<DetailProductRepository>();
    detailProduct.value = await repo.getDetailProduct(id);
    loading(false);
  }

  void increQuantity() {
    count++;
  }

  void desQuantity() {
    if (count <= 0) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text(
                'Error',
                style: h5(context: Get.context!, fontWeight: '700'),
              ),
              contentPadding: const EdgeInsets.all(20),
              children: [
                Text(
                  'Số lượng phải lớn hơn 0',
                  style: h5(
                    context: Get.context!,
                  ),
                )
              ],
            );
          });
    } else {
      count--;
    }
  }
}
