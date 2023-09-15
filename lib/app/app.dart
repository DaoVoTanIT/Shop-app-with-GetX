import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/common/constant/dark_mode.dart';
import 'package:cmms/common/route/app_page.dart';
import 'package:cmms/common/route/route_generator.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/feature/domain/bloc/domain.dart';
import 'package:cmms/feature/forgot_password/checkcode/bloc/check_code_bloc.dart';
import 'package:cmms/feature/forgot_password/forgot_password_bloc/forgot_password/bloc/forgot_password.dart';
import 'package:cmms/feature/home_dashboard/screen/bottom_navigation.dart';
import 'package:cmms/feature/login_signup/login_signup_bloc/bloc/login/export.dart';
import 'package:cmms/feature/login_signup/login_signup_bloc/sign_up/bloc/sign_up_bloc.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyAppState();
  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   print(
  //       'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
  // }
}

class _MyAppState extends State<MyApp> {
  String appBadgeSupport = 'Unknown';

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    String appBadgeSupported;
    try {
      bool res = await FlutterAppBadger.isAppBadgeSupported();
      if (res) {
        appBadgeSupported = 'Supported';
      } else {
        appBadgeSupported = 'Not supported';
      }
    } on PlatformException {
      appBadgeSupported = 'Failed to get badge support.';
    }
    if (!mounted) return;

    setState(() {
      appBadgeSupport = appBadgeSupported;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      initialRoute: '/',
      getPages: AppPages.pages,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: NavigationService.navigatorKey,
      title: 'Computerized Maintenance Management System',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      navigatorObservers: [
        FlutterSmartDialog.observer,
        NavigationHistoryObserver()
      ],
      builder: FlutterSmartDialog.init(),
      darkTheme: darkMode,
      themeMode: ThemeMode.light,
      home: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        child: BottomNavigation(),
      ),
      //   home: MaterialApp(
      //     localizationsDelegates: context.localizationDelegates,
      //     supportedLocales: context.supportedLocales,
      //     locale: context.locale,
      //     initialRoute: '/',
      //     onGenerateRoute: RouteGenerator.generateRoute,
      //     navigatorKey: NavigationService.navigatorKey,
      //     title: 'Computerized Maintenance Management System',
      //     debugShowCheckedModeBanner: false,
      //     theme: lightMode,
      //     navigatorObservers: [
      //       FlutterSmartDialog.observer,
      //       NavigationHistoryObserver()
      //     ],
      //     builder: FlutterSmartDialog.init(),
      //     darkTheme: darkMode,
      //     themeMode: ThemeMode.light,
      //     home: const AnnotatedRegion<SystemUiOverlayStyle>(
      //       value: SystemUiOverlayStyle(
      //         statusBarColor: Colors.transparent,
      //         statusBarIconBrightness: Brightness.dark,
      //         statusBarBrightness: Brightness.light,
      //       ),
      //       child: BottomNavigation(),
      //     ),
      //   ),
    );
  }
}
