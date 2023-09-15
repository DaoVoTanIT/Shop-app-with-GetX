import 'dart:async';
import 'package:cmms/common/refresh_token/refresh_token_reposiotry.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  late Dio dio = Dio();
  Future<Dio> createAsync() async {
    var respList = await Future.wait([
      getValueString(SharedPrefKey.tokenUser),
      getValueString(SharedPrefKey.domain),
      getValueString(SharedPrefKey.refreshToken),
    ]);

    var cookieJar = CookieJar();
    var token = respList[0];
    var domain = respList[1];
    domain = 'fakestoreapi.com';
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(InterceptorsWrapper(
      // onRequest: (options, handler) {
      //   if (!options.path.contains('http')) {
      //     options.path = 'https://$domain${options.path}';
      //   }
      //   options.headers['Authorization'] = 'Bearer $token';
      //   // return dio;
      //   return handler.next(options); //continue
      // },
      onRequest: (options, handler) {
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) async {
        print(e.message);
        print(e.requestOptions.path);
        if ([498].contains(e.response?.statusCode)) {
          final navigationService = GetIt.I<NavigationService>();
          final pref = GetIt.I<SharedPreferences>();
          pref.remove(SharedPrefKey.tokenUser);
          pref.remove(SharedPrefKey.idUser);
          navigationService.pushNamedAndRemoveUntil(
              Routes.login, (route) => false);
        } else if ([401].contains(e.response?.statusCode)) {
          // final options = e.requestOptions;
          // final opts = Options(method: options.method);

          // var refreshToken = await GetIt.I.getAsync<RefreshTokenRepository>();
          // final tokenRefresh = await refreshToken.refreshtToken(
          //     token.toString(), respList[2].toString());

          // if (tokenRefresh == '' || tokenRefresh.isEmpty) {
          //   return handler.reject(e);
          // } else {
          //   await setValueString(SharedPrefKey.tokenUser, tokenRefresh);
          //   dio.options.headers['Authorization'] = 'Bearer $tokenRefresh';
          //   try {
          //     // final res =  refreshToken.fetch(options);
          //     // return handler.resolve(res);
          //     final response = await dio.request(options.path,
          //         options: opts,
          //         data: options.data,
          //         queryParameters: options.queryParameters);
          //     return handler.resolve(response);
          //   } on DioError catch (e) {
          //     handler.next(e);
          //     return;
          //   }
          //}
        } else if (e.message.contains('Failed host lookup')) {
          final navigationService = GetIt.I<NavigationService>();
          final pref = GetIt.I<SharedPreferences>();
          pref.remove(SharedPrefKey.domain);
          pref.remove(SharedPrefKey.tokenUser);
          pref.remove(SharedPrefKey.idUser);
          var currentRoute = navigationService.currentRoute;
          var isPush = currentRoute != Routes.domain;
          if (isPush) {
            navigationService.pushNamedAndRemoveUntil(
                Routes.domain, (p0) => false);
          }
        }
        return handler.next(e); //continue
      },
    ));
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    dio.options.baseUrl = 'https://$domain';
    return dio;
  }
}

// class DioClient {
//   late Dio dio = Dio();
//   Future<Dio> createAsync() async {
//     var respList = await Future.wait([
//       getValueString(SharedPrefKey.tokenUser),
//       getValueString(SharedPrefKey.domain),
//       getValueString(SharedPrefKey.refreshToken),
//     ]);

//     var cookieJar = CookieJar();
//     var token = respList[0];
//     var domain = respList[1];

//     dio.interceptors.add(CookieManager(cookieJar));
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) {
//         return handler.next(options); //continue
//       },
//       onResponse: (response, handler) {
//         return handler.next(response); // continue
//       },
//       onError: (DioError e, handler) async {
//         print(e.message);
//         if ([498].contains(e.response?.statusCode)) {
//           final navigationService = GetIt.I<NavigationService>();
//           final pref = GetIt.I<SharedPreferences>();
//           pref.remove(SharedPrefKey.tokenUser);
//           pref.remove(SharedPrefKey.idUser);
//           navigationService.pushNamedAndRemoveUntil(
//               Routes.login, (route) => false);
//         } else if ([401].contains(e.response?.statusCode)) {
//           final options = e.requestOptions;
//           var refreshToken = await GetIt.I.getAsync<RefreshTokenRepository>();
//           final tokenRefresh = await refreshToken.refreshtToken(
//               token.toString(), respList[2].toString());
//           if (tokenRefresh == '' || tokenRefresh.isEmpty) {
//             return handler.reject(e);
//           } else {
//             await setValueString(SharedPrefKey.tokenUser, tokenRefresh);
//             dio.options.headers['Authorization'] = 'Bearer $tokenRefresh';
//             try {
//               final res = await refreshToken.fetch(options);
//               return handler.resolve(res);
//             } on DioError catch (e) {
//               handler.next(e);
//               return;
//             }
//           }
//         } else if (e.message.contains('Failed host lookup')) {
//           final navigationService = GetIt.I<NavigationService>();
//           final pref = GetIt.I<SharedPreferences>();
//           pref.remove(SharedPrefKey.domain);
//           pref.remove(SharedPrefKey.tokenUser);
//           pref.remove(SharedPrefKey.idUser);
//           var currentRoute = navigationService.currentRoute;
//           var isPush = currentRoute != Routes.domain;
//           if (isPush) {
//             navigationService.pushNamedAndRemoveUntil(
//                 Routes.domain, (p0) => false);
//           }
//         }
//         return handler.next(e); //continue
//       },
//     ));
//     if (token != null) {
//       dio.options.headers['Authorization'] = 'Bearer $token';
//     }
//     dio.options.baseUrl = 'https://$domain';
//     return dio;
//   }
// }
