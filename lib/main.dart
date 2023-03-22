import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qwiva_waitlist/ui/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const Index());
  });
}
