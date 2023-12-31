import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/translations/export_lang.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key, required this.context}) : super(key: key);
  final BuildContext context;
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  DateFormat formatHour = DateFormat(formatHourMinuteString);
  DateFormat formatDateHour = DateFormat(formatDateHourString);
  TextEditingController newPasswordCtl = TextEditingController();
  FocusNode confirmNewPasswordFn = FocusNode();
  TextEditingController confirmNewPasswordCtl = TextEditingController();
  FocusNode newPasswordFn = FocusNode();
  double totalCheckListComplete = 0;
  double totalCheck = 1;
  String chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  String confirmNewPassword = '';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      setState(() {});
    });
    confirmNewPassword = getRandomString(5);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    newPasswordCtl.dispose();
    confirmNewPasswordCtl.dispose();
    confirmNewPasswordFn.dispose();
    newPasswordFn.dispose();
  }

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(
        color: backgroundWhite,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 20, top: 20),
                decoration: const BoxDecoration(color: backgroundWhite),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'changePassword'.tr(),
                        style: h1(context: context, fontWeight: '700'),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'pleaseEnterNewPassword'.tr(),
                        style: h11(
                            context: context,
                            fontWeight: '400',
                            color: grey500),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 34, bottom: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: TextFieldCpn(
                                  controller: newPasswordCtl,
                                  focusNode: newPasswordFn,
                                  focusNext: confirmNewPasswordFn,
                                  labelText: 'system.newPassword'.tr(),
                                  labelStyle:
                                      h7(context: context, fontWeight: 'w600'),
                                ),
                              ),
                              TextFieldCpn(
                                controller: confirmNewPasswordCtl,
                                focusNode: confirmNewPasswordFn,
                                labelText: 'confirmNewPassword'.tr(),
                                labelStyle:
                                    h7(context: context, fontWeight: 'w600'),
                              ),
                            ]),
                      ),
                      ElevatedCpn(
                        function: () {
                          if ((newPasswordCtl.text.isEmpty ||
                                  confirmNewPasswordCtl.text.isEmpty) ||
                              newPasswordCtl.text.length < 6 ||
                              newPasswordCtl.text !=
                                  confirmNewPasswordCtl.text) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Image.asset(
                                      imgWarning,
                                      height: 40,
                                    ),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0))),
                                    content: Text(
                                      (newPasswordCtl.text.isEmpty ||
                                              confirmNewPasswordCtl
                                                  .text.isEmpty)
                                          ? 'enterFullInformation'.tr()
                                          : newPasswordCtl.text.length < 6
                                              ? 'passwordMoreThanCharacters'
                                                  .tr()
                                              : 'error.passwordNotMatched'.tr(),
                                      textAlign: TextAlign.center,
                                      style: h4(
                                          context: context, fontWeight: '700'),
                                    ),
                                    actions: <Widget>[
                                      // TextButton(
                                      //   child: const Text('ok'.tr()),
                                      //   onPressed: () {
                                      //     Navigator.of(context).pop();
                                      //   },
                                      // ),
                                    ],
                                  );
                                });
                          } else {
                            Navigator.pushNamed(
                                context, Routes.changePassSuccess);
                          }
                        },
                        gradient: linear,
                        textButton: 'changePassword'.tr(),
                        textStyle: h5(
                            color: Theme.of(context).color12,
                            fontWeight: '700'),
                      ),
                    ])),
          ],
        ),
      ),
    );
  }
}
