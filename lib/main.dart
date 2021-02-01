import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/location_permission.dart';
import 'package:pakasep/screen/onboarding.dart';
import 'package:pakasep/screen/users/register/ktp_photo_page.dart';
import 'package:pakasep/utility/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding UI',
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      theme: mainTheme(),
    );
  }
}
