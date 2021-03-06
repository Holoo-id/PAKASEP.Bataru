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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 65),
        child: BackOnlyAppbar(
          child: null,
        ),
      ),
      body: WaveBackground(
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
                    'Cek E-mail',
                    style: title900Dark,
                    textAlign: TextAlign.center,
                    presetFontSizes: [28, 25, 20],
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: AutoSizeText(
                    'Periksa e-mail Anda dari PAKASEP untuk melakukan verifikasi e-mail',
                    textAlign: TextAlign.center,
                    style: subtitle600Light2,
                    presetFontSizes: [16, 15, 10],
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
