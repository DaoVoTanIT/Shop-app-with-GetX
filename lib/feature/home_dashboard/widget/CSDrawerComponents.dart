import 'dart:core';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/model/user_model.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/button/outlined_cpn.dart';
import 'package:cmms/common/widget/dialog_custom.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  DrawerPageState createState() => DrawerPageState();
}

class DrawerPageState extends State<DrawerPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  UserModel userModel = UserModel();
  String? domain;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var respList = await Future.wait([
        getValueString(SharedPrefKey.domain),
      ]);
      domain = respList[0];
    });
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(const Duration(seconds: 1));
    scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: const BoxDecoration(
            color: backgroundWhite,
          ),
          // width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 90,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: Image.asset(
                          // 'https://$domain${userModel.imageUrl}',
                          '').image),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    userModel.name?.firstname ?? '',
                    style: h5(context: context, fontWeight: '600'),
                  ),
                  Text(userModel.email ?? '', style: h5(context: context)),
                  const SizedBox(height: 15.0),
                  DialogCustom(
                    childInside: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ImageAsset(imgWarning, width: 72, height: 72),
                        const SizedBox(height: 32),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'message.wantSignOut'.tr(),
                            style: h4(context: context),
                            children: <TextSpan>[
                              // TextSpan(
                              //   text: nameCtl.text,
                              //   style: h4(context: context, fontWeight: '700'),
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedCpn(
                                function: () {
                                  removeValueString(SharedPrefKey.tokenUser);
                                  //   await messaging.deleteToken();
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      Routes.login,
                                      (Route<dynamic> route) => false);
                                },
                                textButton: 'yes'.tr(),
                                textStyle:
                                    h5(color: grayBlue, fontWeight: '700'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedCpn(
                                function: () {
                                  Navigator.of(context).pop();
                                },
                                gradient: linear,
                                textButton: 'no'.tr(),
                                textStyle:
                                    h5(color: grey100, fontWeight: '700'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    childShowDialog: OutlinedCpn(
                      function: (() => {}),
                      textButton: 'signOut'.tr(),
                      borderColor: neonFuchsia,
                      textStyle: h5(color: neonFuchsia, fontWeight: '700'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
