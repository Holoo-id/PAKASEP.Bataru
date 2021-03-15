import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/utility/typhography.dart';

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
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.075, horizontal: size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: AutoSizeText(
                    'Selamat Datang Di Tahap Pra-Registrasi',
                    style: title900Dark,
                    textAlign: TextAlign.center,
                    presetFontSizes: [28, 25, 20],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: AutoSizeText(
                        ' Kapan Tahap Pra-Registrasi Selesai?',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        presetFontSizes: [25, 20, 15],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: AutoSizeText(
                        'Akan ada tahap registrasi setelah tahap ini. Tahap registrasi akan diberitahukan lewat aplikasi maupun oleh tim admin PAKASEP ke nomor handphone yang terdaftar.',
                        textAlign: TextAlign.center,
                        style: subtitle600Light2,
                        presetFontSizes: [16, 15, 10],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 25),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/intro');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width, 60),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
