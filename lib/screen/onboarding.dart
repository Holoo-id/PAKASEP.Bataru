import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/home.dart';
import 'package:pakasep/screen/location_permission.dart';
import 'package:pakasep/utility/style.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  pindah(context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      height: 14.0,
      width: 14.0,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).indicatorColor : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: Theme.of(context).indicatorColor,
          width: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pindah(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.925,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Column(
                                  children: <Widget>[
                                    AutoSizeText(
                                      'Selamat Datang di',
                                      style: title400Light,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      presetFontSizes: [30, 22.5, 15],
                                    ),
                                    // SizedBox(height: 5),
                                    AutoSizeText(
                                      'PAKASEP',
                                      style: title900Light,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      presetFontSizes: [64, 48, 32],
                                    ),
                                    // SizedBox(height: 5),
                                    AutoSizeText(
                                      'PERKUMPULAN AHLI KEPEMILIKAN PERUMAHAN',
                                      style: subtitle600Light,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      presetFontSizes: [16, 12, 8],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.5),
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'images/one_line_art_rumah.png',
                                  ),
                                  fit: BoxFit.fitWidth,
                                  width: size.width,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(0.0),
                        ),
                        Padding(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    AutoSizeText.rich(
                                      TextSpan(
                                        style: title400Light,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'PAKASEP',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' merupakan aplikasi pendukung program ',
                                          ),
                                          TextSpan(
                                            text: 'BAKTI PADAMU GURU (BATARU)',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                      maxLines: 4,
                                      textAlign: TextAlign.center,
                                      presetFontSizes: [28, 21, 14],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 50.0),
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'images/one_line_art_3_polos.png',
                                  ),
                                  fit: BoxFit.fitWidth,
                                  width: size.width,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(0.0),
                        ),
                        Padding(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    AutoSizeText(
                                      'List rumah subsidi?\nDeveloper Perumahan?\nPengurusan KPR?',
                                      style: title700Light,
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      presetFontSizes: [30, 22.5, 15],
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'images/one_line_guru_1.png',
                                  ),
                                  fit: BoxFit.fitWidth,
                                  width: size.width,
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(0.0),
                        ),
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
                      ],
                    ),
                  ),
                ),
                _currentPage == _numPages - 1
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationPermission()),
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
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _buildPageIndicator()),
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
        ),
      ),
    );
  }
}
