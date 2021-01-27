import 'package:flutter/material.dart';

ThemeData mainTheme() {
  // TextTheme _ownTextTheme(TextTheme main) {
  //   return main.copyWith(
  //     title: main.title.copyWith(
  //       fontFamily: 'Poppins',
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w900,
  //       fontSize: 28.0,
  //       color: Color(0xff3F414E)
  //     ),
  //   );
  // }

  final ThemeData main = ThemeData.light();
  return main.copyWith(
    primaryColor: Color(0xff8E97FD),
    accentColor: Color(0xffFA6E5A),
    indicatorColor: Colors.white,
  );
}
