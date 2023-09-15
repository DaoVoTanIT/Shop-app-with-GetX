import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:cmms/feature/login_signup/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/common/widget/text_field/textfield_pass.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();
  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  String? domain;
  final _formKey = GlobalKey<FormState>();
  LoginController controller = Get.put(LoginController());
  @override
  void dispose() {
    emailCtl.dispose();
    passwordCtl.dispose();
    passwordFn.dispose();
    emailFn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    emailCtl.text = 'mor_2314';
    passwordCtl.text = '83r5^_';
    getDomain();
    super.initState();
  }

  getDomain() async {
    var respList = await Future.wait([getValueString(SharedPrefKey.domain)]);
    domain = respList[0].toString();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 76, left: 24, right: 24, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ImageAsset(
                  logoCmms,
                  width: 72,
                  height: 66,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    domain ?? '',
                    style: h5(fontWeight: '700', context: context),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
                TextFieldCpn(
                  labelStyle: h7(context: context, fontWeight: '600'),
                  errText: 'required'.tr,
                  controller: emailCtl,
                  focusNode: emailFn,
                  focusNext: passwordFn,
                  labelText: 'system.account'.tr,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: TextFieldPassCpn(
                    controller: passwordCtl,
                    focusNode: passwordFn,
                    labelText: 'system.password'.tr,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AnimationClick(
                        function: () {
                          Navigator.of(context)
                              .pushNamed(Routes.forgotPassword);
                        },
                        child: Text(
                          '${'system.forgetPass'.tr}?',
                          style: h7(
                              fontWeight: '600',
                              context: context,
                              color: grayBlue),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: AnimationClick(
                        function: () {
                          Navigator.of(context).pushNamed(Routes.signUp);
                        },
                        child: Text(
                          'system.signUp'.tr,
                          style: h7(
                              fontWeight: '700',
                              context: context,
                              color: dodgerBlue),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedCpn(
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      // loginBloc.add(AuthenticateEvent(
                      //     emailCtl.text.trim(), passwordCtl.text.trim()));
                      controller.login(
                          emailCtl.text.trim(), passwordCtl.text.trim());
                    }
                  },
                  gradient: linear,
                  textButton: 'system.logIn'.tr,
                  textStyle:
                      h5(color: Theme.of(context).color12, fontWeight: '700'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'system.domainIncorrect'.tr}?',
                      style: h7(
                          fontWeight: '600', context: context, color: grayBlue),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            Routes.domain, (Route<dynamic> route) => false);
                      },
                      child: Text(
                        ' ${'system.changeDomain'.tr}',
                        style: h7(
                            fontWeight: '600',
                            context: context,
                            color: dodgerBlue),
                      ),
                    ),
                  ],
                ),
                const Expanded(flex: 1, child: SizedBox()),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
