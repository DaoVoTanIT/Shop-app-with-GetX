import 'dart:async';
import 'package:cmms/app/create_notify.dart';
import 'package:cmms/app/injection.dart';
import 'package:cmms/translations/loader.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CreateNotify().createNotification();
  // await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  // FlutterDownloader.registerCallback(MyApp.downloadCallback);

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  setupGetIt();
  await GetIt.I.isReady<SharedPreferences>();
  final EasyLocalization blocProvider = EasyLocalization(
      supportedLocales: const [Locale('vi'), Locale('en')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('vi', 'VN'),
      saveLocale: false,
      useOnlyLangCode: true,
      useFallbackTranslations: true,
      assetLoader: CodegenLoaderLanguage(),
      //  assetLoader: CodegenLoaderLanguage(viData: viData, enData: enData),
      child: const MyApp());

  runApp(blocProvider);
}
