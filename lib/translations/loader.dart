import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';

class CodegenLoaderLanguage extends AssetLoader {
  CodegenLoaderLanguage();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {};
  static const Map<String, dynamic> vi = {};
  static const Map<String, Map<String, dynamic>> mapLocales = {
    'en': en,
    'vi': vi
  };
}
