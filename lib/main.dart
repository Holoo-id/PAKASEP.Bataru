import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/phase1/welcome.dart';
import 'package:pakasep/utility/theme.dart';
import 'package:pakasep/screen/intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pakasep',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      theme: mainTheme(),
      routes: <String, WidgetBuilder>{
        '/intro': (BuildContext context) => new Intro(),
      },
    );
  }
}
