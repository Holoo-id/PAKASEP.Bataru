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
                    maxLines: 2,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: AutoSizeText(
                        'Keuntungan Mengikuti Tahap Pra-Registrasi?',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        maxLines: 2,
                        presetFontSizes: [25, 20, 15],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: AutoSizeText(
                        'Semakin awal anda melakukan pengajuan, data anda akan diproritaskan. Setelah tahap pra-registrasi selesai, anda hanya tinggal memilih rumah yang diinginkan.',
                        textAlign: TextAlign.center,
                        style: subtitle600Light2,
                        presetFontSizes: [16, 15, 10],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 25),
                  child: FlatButton(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
