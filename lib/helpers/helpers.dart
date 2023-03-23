import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qwiva_waitlist/helpers/colors.dart';
import 'package:qwiva_waitlist/ui/components/aqwiva_animated_logo.dart';
import 'package:qwiva_waitlist/ui/components/global_button.dart';
import 'package:sizer/sizer.dart';

import 'global_assets.dart';
import 'text_styles.dart';

void showLoaderDialog(BuildContext context) {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.white,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => WillPopScope(
          onWillPop: () async => false,
          child: const Center(child: QwivaAnimatedLogo(size: 20))));
}

void showSuccessDialog({required BuildContext context, required int count}) {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.black26,
      barrierLabel: 'Dialog',
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => Scaffold(
            backgroundColor: Colors.black26,
            body: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(
                    bottom: 40, top: 40, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(GlobalAssets.successCheck, height: 8.h),
                      SizedBox(height: 4.h),
                      Text('We’ve added you to our waiting list',
                          textAlign: TextAlign.center,
                          style: GlobalTextStyles.bold(fontSize: 24)),
                      SizedBox(height: 2.h),
                      Text('We’ll let you know when Qwiva is live.',
                          textAlign: TextAlign.center,
                          style: GlobalTextStyles.regularText(fontSize: 14)),
                      SizedBox(height: 2.h),
                      Text.rich(TextSpan(
                        children: [
                          TextSpan(
                              text: 'You are number ',
                              style:
                                  GlobalTextStyles.regularText(fontSize: 14)),
                          TextSpan(
                              text: count.toString(),
                              style: GlobalTextStyles.bold()),
                          TextSpan(
                              text: ' on our wait list',
                              style: GlobalTextStyles.regularText(fontSize: 14))
                        ],
                      )),
                      SizedBox(height: 6.h),
                      GlobalButton(
                          btnText: 'Continue',
                          width: 20.h,
                          height: 6.h,
                          color: GlobalColors.primary,
                          onTap: () => Navigator.pop(context))
                    ]),
              ),
            ),
          ));
}

// void globalToast(String message) => Fluttertoast.showToast(
//     msg: message.toUpperFirstCase(),
//     backgroundColor: Colors.black,
//     textColor: Colors.white,
//     fontSize: 15);

void globaLog(String topic, message) => log('$topic $message');

void globalExceptionPrint(String message) =>
    debugPrint('Finance exception $message');

bool isValidEmail(String email) {
  bool emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\'
          r's@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.'
          r'[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.'
          r')+[a-zA-Z]{2,}))$')
      .hasMatch(email);
  if (emailValid) {
    return true;
  } else {
    return false;
  }
}

extension FormValidator on GlobalKey<FormState> {
  bool get validate => formValidator(this);
}

bool formValidator(GlobalKey<FormState> globalKey) {
  return globalKey.currentState!.validate();
}

Text rainbowText(
    {required String title, required String subTitle, double fontSize = 50}) {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xff44BDFF), Color(0xff1FCFC3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 1300, 70.0));

  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
            text: title,
            style: GlobalTextStyles.bold(
                fontSize: fontSize,
                foreground: Paint()..shader = linearGradient)),
        TextSpan(
            text: subTitle,
            style: GlobalTextStyles.bold(
                color: GlobalColors.darkBlue, fontSize: fontSize)),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
