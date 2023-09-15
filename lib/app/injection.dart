import 'package:cmms/app/create_notify.dart';
import 'package:cmms/common/config/dio_client.dart';
import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/common/refresh_token/refresh_token_reposiotry.dart';
import 'package:cmms/feature/domain/repository/domain_repository.dart';
import 'package:cmms/feature/forgot_password/repository/forgot_password_repository.dart';
import 'package:cmms/feature/home_dashboard/repository/home_repository.dart';
import 'package:cmms/feature/login_signup/repository/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../feature/product_detail/repository/product_detail_repository.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerFactoryAsync<Dio>(DioClient().createAsync);
  getIt.registerLazySingletonAsync<SharedPreferences>(
      SharedPreferences.getInstance);
  getIt.registerLazySingleton<CreateNotify>(() => CreateNotify());

  getIt.registerSingletonAsync<DomainRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return DomainRepository(client: dio);
  });

  getIt.registerFactoryAsync<LoginRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return LoginRepository(client: dio);
  });
  getIt.registerFactoryAsync<HomeRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return HomeRepository(client: dio);
  });
  getIt.registerFactoryAsync<DetailProductRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return DetailProductRepository(client: dio);
  });
  getIt.registerSingletonAsync<ForgotPasswordRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return ForgotPasswordRepository(client: dio);
  });

  getIt.registerFactoryAsync<RefreshTokenRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return RefreshTokenRepository(client: dio);
  });

  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
