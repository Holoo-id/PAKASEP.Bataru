import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/utility/typhography.dart';

class RegisterSuccess extends StatefulWidget {
  @override
  _RegisterSuccessState createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: AutoSizeText(
                        'Anda Sudah Terdaftar!',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        maxLines: 2,
                        presetFontSizes: [25, 20, 15],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: AutoSizeText(
                        'Anda telah menyelesaikan proses Pra-Registrasi. Selamat data anda akan kami prioritaskan setelah tahap pra-registrasi selesai. Silahkan tunggu pemberitahuan lebih lanjut.',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
