import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/contents/all_available_units.dart';
import 'package:pakasep/screen/contents/filing_requirements.dart';
import 'package:pakasep/screen/users/profil.dart';
import 'package:pakasep/utility/style.dart';

class Home extends StatefulWidget {
  @override
  Home({Key key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

var menu = [
  {
    "name": "Lihat Semua Perumahan",
    "image": "images/bg4.png",
    "link": AllAvailableUnits(),
  },
  {
    "name": "Telusuri Perumahan",
    "image": "images/bg4.png",
    "link": 6.99,
  },
  {
    "name": "Persyaratan Pengajuan",
    "image": "images/bg4.png",
    "link": FilingRequirements(),
  },
  {
    "name": "Cek Status Pengajuan",
    "image": "images/bg4.png",
    "link": 6.99,
  },
  {
    "name": "Kalkulator & Simulasi KPR",
    "image": "images/bg4.png",
    "link": 6.99,
  },
  {
    "name": "Panduan Penggunaan",
    "image": "images/bg4.png",
    "link": 6.99,
  },
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: WaveBackground(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: size.height * 0.3,
                backgroundColor: Colors.white,
                elevation: 0.0,
                floating: true,
                pinned: true,
                snap: false,
                // leadingWidth: 0,
                flexibleSpace: WaveBackground(
                  // margin: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      AutoSizeText(
                        'Selamat Datang',
                        textAlign: TextAlign.center,
                        style: title900Dark,
                        maxLines: 1,
                        presetFontSizes: [28, 21, 14],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilForm()),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage('images/p1.png'),
                              radius: 40,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              // width: size.width - 112,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AutoSizeText(
                                    'Your Name Was Here',
                                    style: name500Dark,
                                    maxLines: 1,
                                    presetFontSizes: [22, 16.5, 11],
                                  ),
                                  AutoSizeText(
                                    '(1234567890123456)',
                                    style: subName400Dark,
                                    minFontSize: 1,
                                    presetFontSizes: [14, 10.5, 7],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: TextField(
                          onChanged: (value) {
                            // searchResults(value);
                          },
                          // controller: searchControl,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF2F3F7),
                            hintText: 'Cari',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.only(left: 25),
                            suffixIcon: Container(
                              width: 32,
                              height: 32,
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  // showSearch(context: context, delegate: DataSearch());
                                },
                              ),
                            ),
                          ),
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
                Container(
                  child: GridView.count(
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                    childAspectRatio: (176.45 / 168),
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List<Widget>.generate(6, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => menu[index]['link']),
                          );
                        },
                        child: GridTile(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(11.5),
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      menu[index]['image'],
                                    ),
                                    height: 85.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AutoSizeText(
                                  menu[index]['name'],
                                  style: text600Light,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  presetFontSizes: [18, 13.5, 9],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Container(
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
                SizedBox(
                  height: 35,
                ),
                RichText(
                  text: TextSpan(
                    style: text500Grey,
                    children: <TextSpan>[
                      TextSpan(
                        text: '7.548',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' Perumahan Terdaftar',
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: text500Grey,
                    children: <TextSpan>[
                      TextSpan(
                        text: '47',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' Asosiasi Terdaftar',
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: text500Grey,
                    children: <TextSpan>[
                      TextSpan(
                        text: '879.342',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' Unit Tersedia',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
