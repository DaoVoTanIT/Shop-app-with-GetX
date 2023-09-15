import 'package:dio/dio.dart';

class DomainRepository {
  Dio client;
  DomainRepository({required this.client});
  Future<String> checkToken(String domain) async {
    try {
      await client.getUri(Uri.parse('https://${domain.trim()}'));
      return domain;
    } catch (ex) {
      print(ex);
      throw Error();
    }
  }
}
