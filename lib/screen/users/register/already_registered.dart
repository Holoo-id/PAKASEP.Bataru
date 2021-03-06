import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/style.dart';

class AlreadyRegistered extends StatefulWidget {
  @override
  _AlreadyRegisteredState createState() => _AlreadyRegisteredState();
}

class _AlreadyRegisteredState extends State<AlreadyRegistered> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WaveBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackOnlyAppbar(child: null),
              Container(
                alignment: Alignment.center,
                height: size.height,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        'Anda Sudah Terdaftar!',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        maxLines: 1,
                        presetFontSizes: [25, 20, 15],
                      ),
                      AutoSizeText(
                        'Anda sudah terdaftar di aplikasi PAKASEP. Silahkan tunggu pemberitahuan lebih lanjut.',
                        // 'Tidak perlu mendaftar lagi Silahkan masuk ke aplikasi',
                        textAlign: TextAlign.center,
                        style: subtitle600Light2,
                        presetFontSizes: [16, 15, 10],
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/intro');
                        },
                        height: 60,
                        minWidth: size.width,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'MENGERTI',
                          style: buttonTextLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
