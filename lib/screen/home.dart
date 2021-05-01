import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/menu.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/users/profil.dart';
import 'package:pakasep/utility/typhography.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  String userID, userName, userKTP;
  @override
  Home({Key key, this.userID, this.userKTP, this.userName}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    // futureGetUser();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight:
                  widget.userID == null ? size.height * 0.15 : size.height * 0.3,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              floating: true,
              pinned: true,
              snap: false,
              // leadingWidth: 0,
              flexibleSpace: WaveBackground(
                // margin: EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // FractionallySizedBox(
                    //   widthFactor: 0.92,
                    //   child: AutoSizeText(
                    //     'Selamat Datang',
                    //     textAlign: TextAlign.center,
                    //     style: title900Dark,
                    //     presetFontSizes: [28, 25, 20, 15, 10, 5],
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        widget.userID == null
                            ? print('No Data')
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilForm()),
                              );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // CircleAvatar(
                          //   backgroundImage: AssetImage('images/p1.png'),
                          //   radius: 40,
                          // ),
                          SizedBox(
                            width: 20,
                          ),
                          widget.userID == null
                              ? Container(
                                  width: 0,
                                  height: 0,
                                )
                              : Container(
                                  // width: size.width - 112,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AutoSizeText(
                                        widget.userName,
                                        style: name500Dark,
                                        // maxLines: 1,
                                        presetFontSizes: [22, 20, 15, 10, 5],
                                      ),
                                      AutoSizeText(
                                        widget.userKTP,
                                        style: subName400Dark,
                                        presetFontSizes: [14, 10, 5],
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              MenuHome(),
              GestureDetector(
                onTap: () async {
                  const _url = 'https://www.instagram.com/bataru.pakasep/';
                  if (await canLaunch(_url)) {
                    await launch(_url);
                  } else {
                    throw 'Tidak dapat membuka $_url';
                  }
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 14.5),
                  height: 80,
                  width: size.width - 40,
                  decoration: BoxDecoration(
                    color: Color(0xffF1DDCF),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        'images/bg5.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hubungi Kami',
                        style: text600Dark,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Jika ada masalah/pertanyaan',
                        style: text400Grey,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 35,
              // ),
              // RichText(
              //   text: TextSpan(
              //     style: text500Grey,
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: '7.548',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       TextSpan(
              //         text: ' Perumahan Terdaftar',
              //       ),
              //     ],
              //   ),
              // ),
              // RichText(
              //   text: TextSpan(
              //     style: text500Grey,
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: '47',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       TextSpan(
              //         text: ' Asosiasi Terdaftar',
              //       ),
              //     ],
              //   ),
              // ),
              // RichText(
              //   text: TextSpan(
              //     style: text500Grey,
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: '879.342',
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //       TextSpan(
              //         text: ' Unit Tersedia',
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
