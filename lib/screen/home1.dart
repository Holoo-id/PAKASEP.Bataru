import 'package:flutter/material.dart';
import 'package:pakasep/screen/users/login/login_form.dart';
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
    "link": LoginForm(),
  },
  {
    "name": "Telusuri Perumahan",
    "image": "images/bg4.png",
    "link": 6.99,
  },
  {
    "name": "Persyaratan Pengajuan",
    "image": "images/bg4.png",
    "link": 6.99,
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
  TextEditingController searchControl = TextEditingController();
  final duplicateUnits = List<String>.generate(99, (i) => "Unit $i");
  var units = List<String>();
  @override
  void initState() {
    super.initState();
  }

  void searchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateUnits);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        units.clear();
        units.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        units.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 255, 10, 0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: GridView.count(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 3,
                      childAspectRatio: (176 / 167),
                      controller: new ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: List<Widget>.generate(6, (index) {
                        return GridTile(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(11.5),
                            decoration: BoxDecoration(
                                color: Color(0xffFA6E5A),
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
                                Text(
                                  menu[index]['name'],
                                  style: text600Light,
                                  textAlign: TextAlign.center,
                                ),
                              ],
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
          Container(
            // height: 450,
            // color: Colors.white,
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Text(
                  'Selamat Datang',
                  textAlign: TextAlign.center,
                  style: title900Dark,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/p1.png'),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Your Name Was Here',
                          style: name500Dark,
                        ),
                        Text(
                          '(1234567890123456)',
                          style: subName400Dark,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          // if (value.isEmpty) {
                          //   return '';
                          // } else {
                          //   searchResults(value);
                          // }
                          searchResults(value);
                        },
                        controller: searchControl,
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
                                }),
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: units.length >= 3 ? 3 : units.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(
                                  Icons.location_pin,
                                ),
                                title: Text('${units[index]}'),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}