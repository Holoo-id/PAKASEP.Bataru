import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/typhography.dart';

class UserGuide extends StatefulWidget {
  @override
  _UserGuideState createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: size.height * 0.24,
                leadingWidth: 70,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                floating: true,
                pinned: true,
                snap: false,
                centerTitle: true,
                leading: Platform.isIOS
                    ? Container(
                        alignment: Alignment.topLeft,
                        color: Colors.transparent,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0)),
                              border: Border.all(color: Color(0xffe5e5e5))),
                          child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Color(0xff3F414E),
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    : Container(height: 0, width: 0),
                flexibleSpace: Container(
                  width: size.width,
                  color: Colors.transparent,
                  child: WaveBackground(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 0.84,
                          child: AutoSizeText(
                            'Panduan Pengguna',
                            textAlign: TextAlign.center,
                            style: title900Dark,
                            presetFontSizes: [28, 25, 20, 15, 10, 5],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            height: 0,
            width: 0,
            padding: EdgeInsets.only(bottom: size.height * 0.05),
          )),
    );
  }
}
