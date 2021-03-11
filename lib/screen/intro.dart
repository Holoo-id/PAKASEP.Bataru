import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/intro_background.dart';
import 'package:pakasep/screen/users/login/login_form.dart';
import 'package:pakasep/screen/users/register/register_form.dart';
import 'package:pakasep/utility/typhography.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: IntroBackground(
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AutoSizeText(
                  'Cari Rumah Tak Lagi Susah',
                  style: title600Dark,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                AutoSizeText(
                  'Telusuri berbagai macam pilihan perumahan dari berbagai developer',
                  style: subtitle600Light2,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  presetFontSizes: [16, 12, 8],
                ),
                SizedBox(
                  height: 60.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterForm()),
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size(size.width, 60),
                    onSurface: Colors.white,
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'DAFTAR',
                    style: buttonTextLight,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginForm()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'SUDAH PUNYA AKUN? KLIK DISINI',
                      style: linkTextLight,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      presetFontSizes: [14, 12, 8],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
