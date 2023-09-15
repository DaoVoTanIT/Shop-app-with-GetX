import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCpn extends StatelessWidget {
  const TextFieldCpn({
    this.onChanged,
    this.onTap,
    required this.controller,
    this.focusNode,
    this.labelText,
    this.showSuffixIcon = false,
    this.showPrefixIcon = false,
    this.colorSuffixIcon,
    this.colorPrefixIcon,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNext,
    this.hasMutilLine = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.functionPrefix,
    this.functionSuffer,
    this.enabled = true,
    this.hintText,
    this.labelStyle,
    this.errText,
    this.fillColor,
    this.keyboardType,
    this.showRequired = false,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? focusNext;
  final String? labelText;
  final bool showSuffixIcon;
  final bool showPrefixIcon;
  final bool showRequired;
  final String? prefixIcon;
  final Color? colorPrefixIcon;
  final Icon? suffixIcon;
  final Color? colorSuffixIcon;
  final Color? fillColor;
  final bool hasMutilLine;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Function()? onTap;
  final Function()? functionPrefix;
  final Function()? functionSuffer;
  final String? hintText;
  final TextStyle? labelStyle;
  final String? errText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;

  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color ?? const Color(0xFFF0F0F0)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText!.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: labelText,
                    style: labelStyle ??
                        const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: showRequired == false ? '' : ' *',
                        style: h4(
                            context: context, fontWeight: '700', color: red600),
                      ),
                    ],
                  ),
                ),
              ),
        TextFormField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: onChanged ?? (value) {},
            onTap: onTap,
            cursorColor: const Color(0xFF0EAD69),
            controller: controller,
            // focusNode: focusNode,
            maxLines: maxLines ?? (hasMutilLine ? null : 1),
            minLines: minLines,
            readOnly: readOnly,
            maxLength: maxLength,
            keyboardType: keyboardType ?? TextInputType.text,
            validator: (val) {
              if (val!.isEmpty) {
                return errText;
              }
              return null;
            },
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: h5(context: context),
              fillColor: fillColor ?? CupertinoColors.white,
              filled: true,
              contentPadding: const EdgeInsets.all(12),
              prefixIcon: showPrefixIcon
                  ? AnimationClick(
                      function: functionPrefix ?? () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Image.asset(
                          prefixIcon ?? icCalendar,
                          height: 24,
                          width: 24,
                          color: colorPrefixIcon ?? const Color(0xFF1DA1F2),
                        ),
                      ),
                    )
                  : const SizedBox(),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              suffixIcon: showSuffixIcon
                  ? AnimationClick(
                      function: functionSuffer ?? () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: suffixIcon ??
                            Image.asset(
                              'assets/images/calendar.png',
                              height: 24,
                              width: 24,
                              color: colorSuffixIcon ?? const Color(0xFF1DA1F2),
                            ),
                      ),
                    )
                  : const SizedBox(),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              focusedBorder: createInputDecoration(
                context,
              ),
              enabledBorder: createInputDecoration(context),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.red,
                  )),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              enabled: enabled,
            )),
      ],
    );
  }
}
