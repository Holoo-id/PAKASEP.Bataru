import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/register/register_form.dart';
import 'package:pakasep/utility/style.dart';

class PraRegistration3 extends StatefulWidget {
  @override
  _PraRegistration3State createState() => _PraRegistration3State();
}

class _PraRegistration3State extends State<PraRegistration3> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 65),
        child: BackOnlyAppbar(
          child: null,
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            height: size.height,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  'Selamat Datang Di Tahap Pra-Registrasi',
                  style: title900Dark,
                  textAlign: TextAlign.center,
                  presetFontSizes: [28, 20],
                  maxLines: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AutoSizeText(
                      ' Kapan Tahap Pra-Registrasi Selesai?',
                      textAlign: TextAlign.center,
                      style: title600Dark,
                      maxLines: 2,
                    ),
                    AutoSizeText(
                      'Akan ada tahap registrasi setelah tahap ini. Tahap registrasi akan diberitahukan lewat aplikasi maupun oleh tim admin PAKASEP ke nomor handphone yang terdaftar.',
                      textAlign: TextAlign.center,
                      style: subtitle600Light2,
                    ),
                  ],
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterForm()),
                    );
                  },
                  height: 60,
                  minWidth: size.width,
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'DAFTAR',
                    style: buttonTextLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
