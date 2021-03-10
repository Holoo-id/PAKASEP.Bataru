import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/phase1/pra-registration_detail1.dart';
import 'package:pakasep/utility/typhography.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
        height: size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.35,
                child: Image(
                  image: AssetImage(
                    'images/pakasep_logo.png',
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
FractionallySizedBox(
                  widthFactor: 1,
                  child: AutoSizeText(
                    'PAKASEP',
                    style: title900Light,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    presetFontSizes: [64, 56, 48],

                    ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: AutoSizeText(
                    'PERKUMPULAN AHLI KEPEMILIKAN SUBSIDI PERUMAHAN',
                    textAlign: TextAlign.center,
                    style: subtitle600Light,
                    maxLines: 1,
                    presetFontSizes: [16, 12, 8],
                  ),
                ),
              ],
            ),
            Flexible(
              fit: FlexFit.tight,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Image(
                    image: AssetImage(
                      'images/one_line_art_rumah.png',
                    ),
                    fit: BoxFit.fitWidth,
                    width: size.width,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01, horizontal: 20),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PraRegistration1()),
                  );
                },
                height: size.height * 0.07,
                minWidth: size.width * 0.75,
                color: Color(0xffEBEAEC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'MULAI SEKARANG',
                  style: buttonTextDark,
                ),
              ),
            ),
            AutoSizeText.rich(
              TextSpan(
                style: watermark400Light,
                children: <TextSpan>[
                  TextSpan(text: '© Copyright 2021 — '),
                  TextSpan(
                    text: 'PAKASEP',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: '. All Rights Reserved. Created by '),
                  TextSpan(
                    text: 'Marketpreneur.id',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              maxLines: 1,
              presetFontSizes: [12, 8, 6],
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
