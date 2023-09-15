import 'dart:convert';

import 'package:dio/dio.dart';

class LoadLanguage {
  Dio client;
  LoadLanguage({required this.client});
  Future<Map<String, dynamic>> loadLanguage(String country) async {
    final response = await client.get(
      '/api/SystemLanguage/Get/$country',
    );
    final Map<String, dynamic> languageData = json.decode(response.toString());

    return languageData;
  }
}
