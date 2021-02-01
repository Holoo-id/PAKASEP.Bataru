import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/location_permission.dart';
import 'package:pakasep/utility/style.dart';
// import 'package:permission_handler/permission_handler.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
        color: isActive ? Color(0xFF2D2D41) : Theme.of(context).indicatorColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: size.height * 0.8125,
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
                                  'images/bg1.png',
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
                                    'Ingin punya rumah?\nBingung cari developer?\nSusah urus KPR?',
                                    style: title700Light,
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    presetFontSizes: [30, 22.5, 15],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50.0),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/bg1.png',
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
                            SizedBox(height: 50.0),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/bg1.png',
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
                                  SizedBox(height: 5.0),
                                  Image(
                                    image: AssetImage(
                                      'images/pakasep_logo.png',
                                    ),
                                    width: 150,
                                    // fit: BoxFit.fitWidth,
                                    // width: size.width,
                                  ),
                                  AutoSizeText(
                                    'PAKASEP',
                                    style: title900Light,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    presetFontSizes: [64, 48, 32],
                                  ),
                                  SizedBox(height: 5.0),
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
                            SizedBox(height: 25.0),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/bg1.png',
                                ),
                                fit: BoxFit.fitWidth,
                                width: size.width,
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(0.0),
                      ),
                    ],
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
                SizedBox(
                  height: 10,
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
                  // minFontSize: 6,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
