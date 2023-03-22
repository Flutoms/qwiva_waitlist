import 'package:flutter/material.dart';
import 'package:qwiva_waitlist/helpers/responsive/responsive_layout.dart';
import 'package:qwiva_waitlist/ui/web_view.dart';

import 'mobile_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: ResponsiveLayout(
              mobileBody: MobileView(), desktopBody: WebView())),
    );
  }
}
