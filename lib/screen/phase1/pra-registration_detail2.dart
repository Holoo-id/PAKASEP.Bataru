import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/phase1/pra-registration_detail3.dart';
import 'package:pakasep/utility/style.dart';

class PraRegistration2 extends StatefulWidget {
  @override
  _PraRegistration2State createState() => _PraRegistration2State();
}

class _PraRegistration2State extends State<PraRegistration2> {
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
                      'Keuntungan Mengikuti Tahap Pra-Registrasi?',
                      textAlign: TextAlign.center,
                      style: title600Dark,
                      maxLines: 2,
                    ),
                    AutoSizeText(
                      'Semakin awal anda melakukan pengajuan, data anda akan diproritaskan setelah tahap pra-registrasi selesai. Di tahap registrasi anda hanya tinggal memilih rumah yang diinginkan.',
                      textAlign: TextAlign.center,
                      style: subtitle600Light2,
                    ),
                  ],
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PraRegistration3()),
                    );
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
      ),
    );
  }
}
