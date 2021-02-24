import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/contents/all_available_units.dart';
import 'package:pakasep/screen/home.dart';
import 'package:pakasep/screen/location_permission.dart';
import 'package:pakasep/screen/onboarding.dart';
import 'package:pakasep/screen/users/register/ktp_photo_page.dart';
import 'package:pakasep/utility/theme.dart';

import 'model_sqlite/userLoggedDB.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {

  // @override
  // void initState() {
  //   futureUserCount();
  //   super.initState();
  // }
  // futureUserCount<int>() async {

  //   UserLoggedDB userLoggedDB = UserLoggedDB();
  //   var count = await userLoggedDB.getLength();

  //   if (count > 0) {
  //     Navigator.push(context, MaterialPageRoute(
  //         builder: (context) => Home()
  //     ));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding UI',
      debugShowCheckedModeBanner: false,
      home: AllAvailableUnits(),
      theme: mainTheme(),
    );
  }
}
