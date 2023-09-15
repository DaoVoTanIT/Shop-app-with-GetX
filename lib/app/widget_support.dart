// ignore_for_file: avoid_print

import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:flutter/material.dart';

mixin AppWidget {
  static double getHeightScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getBottomIndicator(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static Widget divider() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        gradient: linear,
      ),
    );
  }

  static Widget divider2({Color? color}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 1.1,
      color: color ?? backgroundColor2,
    );
  }

  static Widget people(
    BuildContext context,
    String icon,
    String title,
    Color? colorSelected, {
    required bool selected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              boxShadow: selected
                  ? [
                      BoxShadow(
                          color: colorSelected == null
                              ? dodgerBlue
                              : colorSelected.withOpacity(0.3),
                          offset: const Offset(0, 10),
                          blurRadius: 20)
                    ]
                  : [],
              color: selected ? colorSelected : backgroundColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                  color: selected ? colorSelected ?? dodgerBlue : border)),
          child: ImageAsset(
            icon,
            width: 24,
            height: 24,
            color: selected ? grey100 : grayBlue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            title,
            style: h6(context: context, fontWeight: selected ? '700' : '400'),
          ),
        )
      ],
    );
  }
}
