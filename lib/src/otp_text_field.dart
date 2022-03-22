import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'otp_text.dart';

class FlutterOtpTextField extends StatelessWidget {
  FlutterOtpTextField({
    Key? key,
    this.enabled = true,
    this.controller,
    this.autofocus = false,
    required this.otpCode,
    this.onChanged,
    this.isFourDigit = false,
    this.style,
    this.elevation = 2.0,
    this.color,
    this.shape,
  }) : super(key: key);

  final bool enabled;
  final bool autofocus;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String otpCode;
  final bool isFourDigit;
  final TextStyle? style;

  final double elevation;
  final Color? color;
  final RoundedRectangleBorder? shape;

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.requestFocus();
      },
      child: Stack(
        children: [
          Opacity(
            opacity: 0.0,
            child: TextField(
              focusNode: focusNode,
              enabled: enabled,
              controller: controller,
              enableInteractiveSelection: false,
              autofocus: autofocus,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: isFourDigit ? 4 : 6,
              onChanged: onChanged,
              decoration: const InputDecoration(
                isDense: true,
                counter: SizedBox.shrink(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OtpText(
                    text: otpCode.isNotEmpty ? otpCode[0] : "",
                    style: style,
                    color: color,
                    elevation: elevation,
                    shape: shape,
                  ),
                ),
                Expanded(
                  child: OtpText(
                    text: otpCode.length > 1 ? otpCode[1] : "",
                    style: style,
                    color: color,
                    elevation: elevation,
                    shape: shape,
                  ),
                ),
                Expanded(
                  child: OtpText(
                    text: otpCode.length > 2 ? otpCode[2] : "",
                    style: style,
                    color: color,
                    elevation: elevation,
                    shape: shape,
                  ),
                ),
                Expanded(
                  child: OtpText(
                    text: otpCode.length > 3 ? otpCode[3] : "",
                    style: style,
                    color: color,
                    elevation: elevation,
                    shape: shape,
                  ),
                ),
                Visibility(
                  visible: !isFourDigit,
                  child: Expanded(
                    child: OtpText(
                      text: otpCode.length > 4 ? otpCode[4] : "",
                      style: style,
                      color: color,
                      elevation: elevation,
                      shape: shape,
                    ),
                  ),
                ),
                Visibility(
                  visible: !isFourDigit,
                  child: Expanded(
                    child: OtpText(
                      text: otpCode.length > 5 ? otpCode[5] : "",
                      style: style,
                      color: color,
                      elevation: elevation,
                      shape: shape,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
