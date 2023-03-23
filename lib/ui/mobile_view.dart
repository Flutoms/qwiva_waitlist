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

class MobileView extends StatefulWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(GlobalAssets.footerDecorationMobile)),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(10.h),
                        SvgPicture.asset(GlobalAssets.logo),
                        Gap(6.h),
                        rainbowText(
                            title: 'Quality Health ',
                            subTitle: 'for \nEveryone',
                            fontSize: 40),
                        Gap(5.h),
                        SizedBox(
                          width: 80.w,
                          child: Text(
                              'Get your medications effortlessly without '
                              'having to visit multiple pharmacies. '
                              'Be the first to know when we launch.',
                              textAlign: TextAlign.center,
                              style: GlobalTextStyles.regularText()),
                        ),
                        Gap(5.h),
                        SizedBox(
                          width: 100.w,
                          child: GlobalFormField(
                              fieldName: 'Tell us your name ...',
                              keyBoardType: TextInputType.name,
                              textController: nameController),
                        ),
                        Gap(3.h),
                        SizedBox(
                          width: 100.w,
                          child: GlobalFormField(
                              fieldName: 'Enter your email address ...',
                              keyBoardType: TextInputType.emailAddress,
                              textController: emailController),
                        ),
                        Gap(3.h),
                        GlobalButton(
                            btnText: 'Notify me on launch',
                            height: 7.h,
                            onTap: () {
                              if (formKey.validate) {
                                FireStoreService.addToWaitList(
                                    name: nameController.text,
                                    email: emailController.text,
                                    context: context);
                              }
                            }),
                        Gap(5.h),
                        Image.asset(GlobalAssets.peopleWebView),
                        Gap(5.h),
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
        ));
  }
}
