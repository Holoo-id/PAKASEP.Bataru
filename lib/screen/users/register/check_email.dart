import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/style.dart';

class CheckEmail extends StatefulWidget {
  final Map<String, dynamic> userData;
  const CheckEmail({Key key, this.userData}) : super(key: key);
  @override
  _CheckEmailState createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaveBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackOnlyAppbar(child: null),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        'Cek E-mail Anda',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        // phase1
                        'Cek e-mail untuk memverifikasi akun e-mail Anda di Pakasep',
                        // default
                        // 'Klik tombol dibawah ini untuk masuk ke aplikasi',
                        textAlign: TextAlign.center,
                        style: subtitle600Light2,
                        maxLines: 2,
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
