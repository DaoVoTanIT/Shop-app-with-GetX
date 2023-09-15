import 'package:cmms/common/route/routes.dart';
import 'package:cmms/feature/login_signup/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  Future<void> login(String username, String pass) async {
    try {
      loading(true);
      var repo = await GetIt.I.getAsync<LoginRepository>();
      await repo.authenticateUser(username, pass);
      loading(false);
      Get.offAndToNamed(Routes.home);
    } catch (e) {
      print(e.toString());
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
