import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:qwiva_waitlist/helpers/global_assets.dart';
import 'package:qwiva_waitlist/helpers/helpers.dart';
import 'package:qwiva_waitlist/helpers/text_styles.dart';
import 'package:qwiva_waitlist/ui/service.dart';
import 'package:sizer/sizer.dart';

import 'components/global_button.dart';
import 'components/global_form_field.dart';

class WebView extends StatefulWidget {
  const WebView({Key? key}) : super(key: key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Image.asset(GlobalAssets.bg),
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(GlobalAssets.footerDecoration)),
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(6.h),
                        SvgPicture.asset(GlobalAssets.logo),
                        Gap(10.h),
                        rainbowText(
                            title: 'Quality Health ',
                            subTitle: 'for \nEveryone',
                            fontSize: 60),
                        Gap(4.h),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                              'Get your medications with ease, '
                              'no need to move from pharmacies to '
                              'pharmacies. Get notified when we launch.',
                              textAlign: TextAlign.center,
                              style: GlobalTextStyles.regularText()),
                        ),
                        Gap(4.h),
                        SizedBox(
                          width: 430,
                          child: GlobalFormField(
                              fieldName: 'Tell us your name ...',
                              keyBoardType: TextInputType.name,
                              textController: nameController),
                        ),
                        Gap(2.h),
                        SizedBox(
                          width: 430,
                          child: GlobalFormField(
                              fieldName: 'Enter your email address ...',
                              keyBoardType: TextInputType.emailAddress,
                              textController: emailController),
                        ),
                        Gap(4.h),
                        GlobalButton(
                            btnText: 'Notify me on launch',
                            height: 7.h,
                            width: 430,
                            onTap: () {
                              if (formKey.validate) {
                                FireStoreService.addToWaitList(
                                    name: nameController.text,
                                    email: emailController.text,
                                    context: context);
                              }
                            }),
                        Gap(4.h),
                        Image.asset(GlobalAssets.peopleWebView),
                        Gap(4.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '+200 ',
                                  style: GlobalTextStyles.bold(fontSize: 18)),
                              TextSpan(
                                  text: 'People joined',
                                  style: GlobalTextStyles.regularText()),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
