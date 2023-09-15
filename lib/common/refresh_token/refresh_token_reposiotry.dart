import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class RefreshTokenRepository {
  Dio client;

  RefreshTokenRepository({required this.client});

  Future<String> refreshtToken(String accessToken, String refreshToken) async {
    final response = await client.post('/api/auth/Refresh/',
        data: {'accessToken': accessToken, 'refreshToken': refreshToken});
    SmartDialog.dismiss();
    return response.data['data']['accessToken'];
  }

  void fetch(RequestOptions options) => client.fetch(options);
}
