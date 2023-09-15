import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/translations/export_lang.dart';

Future<void> alearDialog(BuildContext context, String content,
    final Function()? function, bool? showButtonClose) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Image.asset(
            imgWarning,
            height: 40,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          content: Text(
            content.tr(),
            textAlign: TextAlign.center,
            style: h4(context: context, fontWeight: '700'),
          ),
          actions: <Widget>[
            showButtonClose == true
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: grey300),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: TextButton(
                          child: Text(
                            'cmms.yes'.tr(),
                            style: h5(
                                context: context,
                                fontWeight: '600',
                                color: redLight),
                          ),
                          onPressed: () {
                            // notificationBloc.add(ReadNotificationEvent(
                            //     1, noti.id.toString()));
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: tiffanyBlue,
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: TextButton(
                          child: Text(
                            'cmms.no'.tr(),
                            style: h5(
                                context: context,
                                fontWeight: '600',
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  )
          ],
        );
      });
}

class DialogAction {
  static void showCustomDialog(
      {required BuildContext context, required final Widget childInside}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: grey100,
          child: Container(
            padding: const EdgeInsets.all(32),
            child: childInside,
          ),
        );
      },
    );
  }
}

void showSuccess({required BuildContext context}) {
  DialogAction.showCustomDialog(
      context: context,
      childInside: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${'success'.tr()}!',
            style: const TextStyle(
                fontSize: 15,
                height: 1.25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Mulish'),
          ),
          const SizedBox(height: 32),
          Image.asset(
            imgSuccess,
            height: 80,
          ),
          const SizedBox(height: 32),
          ElevatedCpn(
            function: () {
              Navigator.of(context).pop();
            },
            gradient: linear,
            textButton: 'OK',
            textStyle: h5(color: grey100, fontWeight: '700'),
          ),
        ],
      ));
}
