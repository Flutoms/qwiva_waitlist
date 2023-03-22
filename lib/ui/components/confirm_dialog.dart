import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qwiva_waitlist/helpers/global_assets.dart';
import 'package:qwiva_waitlist/helpers/size_config.dart';
import 'package:qwiva_waitlist/helpers/text_styles.dart';
import 'package:sizer/sizer.dart';

class ConfirmDialog extends StatefulWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 2.h),
                Image.asset(GlobalAssets.successCheck, height: 8.h),
                SizedBox(height: 2.h),
                Text('We’ve added you to our waiting list',
                    textAlign: TextAlign.center,
                    style: GlobalTextStyles.bold(fontSize: 24)),
                SizedBox(height: 2.h),
                Text('We’ll let you know when Qwiva is live.',
                    textAlign: TextAlign.center,
                    style: GlobalTextStyles.regularText(fontSize: 14)),
                SizedBox(height: 2.h),
                Text('You are number 296 on our wait list',
                    textAlign: TextAlign.center,
                    style: GlobalTextStyles.regularText(fontSize: 14)),
                SizedBox(height: 8.h),
              ]),
        ));
  }
}
