import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/phase1/pra-registration_detail1.dart';
import 'package:pakasep/utility/style.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 1,
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                            'images/pakasep_logo.png',
                          ),
                        ),
                        AutoSizeText(
                          'PAKASEP',
                          style: title900Light,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          presetFontSizes: [64, 48, 32],
                        ),
                        AutoSizeText(
                          'PERKUMPULAN AHLI KPR SUBSIDI PERUMAHAN',
                          textAlign: TextAlign.center,
                          style: subtitle600Light,
                          maxLines: 1,
                          presetFontSizes: [16, 12, 8],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 1.5,
                    child: Image(
                      image: AssetImage(
                        'images/one_line_art_rumah.png',
                      ),
                      fit: BoxFit.fitWidth,
                      width: size.width,
                    ),
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.all(0.0),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PraRegistration1()),
                );
              },
              height: 60,
              minWidth: size.width,
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
    );
  }
}
