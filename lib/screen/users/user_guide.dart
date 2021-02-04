import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/style.dart';

class UserGuide extends StatefulWidget {
  @override
  _UserGuideState createState() => _UserGuideState();
}

class _UserGuideState extends State<UserGuide> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 130,
                leadingWidth: 70,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                floating: true,
                pinned: true,
                snap: false,
                leading: Container(
                  alignment: Alignment.topLeft,
                  color: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                ),
                flexibleSpace: Container(
                  width: size.width,
                  color: Colors.white,
                  child: WaveBackground(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            'Panduan Pengguna',
                            textAlign: TextAlign.center,
                            style: title900Dark,
                            maxLines: 1,
                            presetFontSizes: [28, 21, 14],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container()),
    );
  }
}
