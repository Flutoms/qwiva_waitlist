import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qwiva_waitlist/helpers/colors.dart';
import 'package:qwiva_waitlist/ui/home.dart';
import 'package:sizer/sizer.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Qwiva.io',
            debugShowCheckedModeBanner: false,
            home: const Home(),
            theme: ThemeData(primarySwatch: GlobalColors.materialPrimaryColor),
          );
        }));
  }
}
