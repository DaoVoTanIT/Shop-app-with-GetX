import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

Future<String> getDomain() async {
  var respList = await Future.wait([
    getValueString(SharedPrefKey.domain),
  ]);
  return respList[0].toString();
}
