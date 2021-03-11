import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/utility/typhography.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
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
                                    FractionallySizedBox(
                                      widthFactor: 0.69,
                                      child: AutoSizeText(
                                        'Selamat Datang di',
                                        style: title400Light,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        presetFontSizes: [30, 22.5, 15],
                                      ),
                                    ),
                                    FractionallySizedBox(
                                      widthFactor: 0.8,
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
                                        'PERKUMPULAN AHLI KPR SUBSIDI PERUMAHAN',
                                        textAlign: TextAlign.center,
                                        style: subtitle600Light,
                                        maxLines: 1,
                                        presetFontSizes: [16, 12, 8],
                                      ),
                                    ),
                                  ],
                                ),
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
                                    FractionallySizedBox(
                                      widthFactor: 0.92,
                                      // heightFactor: 0.37,
                                      child: AutoSizeText.rich(
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
                                              text:
                                                  'BAKTI PADAMU GURU (BATARU)',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        maxLines: 4,
                                        textAlign: TextAlign.center,
                                        presetFontSizes: [25, 20, 15, 10, 5],
                                      ),
                                    ),
                                  ],
                                ),
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
                                        'images/one_line_art_3_polos.png',
                                      ),
                                      fit: BoxFit.fitWidth,
                                      width: size.width,
                                    ),
                                  ),
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
                              Flexible(
                                fit: FlexFit.tight,
                                child: FractionallySizedBox(
                                  heightFactor: 1,
                                  widthFactor: 1,
                                  child: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: Image(
                                      image: AssetImage(
                                        'images/one_line_guru_1.png',
                                      ),
                                      fit: BoxFit.fitWidth,
                                      width: size.width,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(0.0),
                        ),
                        Padding(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: FractionallySizedBox(
                                  heightFactor: 0.38,
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
                                    widthFactor: 0.8,
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
                                      'PERKUMPULAN AHLI KPR SUBSIDI PERUMAHAN',
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
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01, horizontal: 20),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/intro');
                          },
                          style: TextButton.styleFrom(
                            minimumSize:
                                Size(size.width * 0.75, size.height * 0.07),
                            onSurface: Colors.black87,
                            primary: Color(0xffEBEAEC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
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
