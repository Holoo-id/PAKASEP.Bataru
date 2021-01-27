import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/contents/unit_detail.dart';
import 'package:pakasep/screen/intro.dart';
import 'package:pakasep/screen/users/profil.dart';
import 'package:pakasep/screen/users/register/already_registered.dart';
import 'package:pakasep/screen/users/register/register_success.dart';
import 'package:pakasep/utility/style.dart';

class AllAvailableUnits extends StatefulWidget {
  @override
  AllAvailableUnits({Key key}) : super(key: key);
  _AllAvailableUnitsState createState() => _AllAvailableUnitsState();
}

var units = [
  {
    "image": "images/r1.jpg",
    "name": "Perumahan Griya Caraka Indah",
    "location": "Cimalaka, Kab. Sumedang Jawa Barat",
    "association": "PT TRI KARYA LINGGA (ASPRUMNAS)",
    "link": UnitDetail(),
  },
  {
    "image": "images/bg4.png",
    "name": "Perumahan Griya Caraka Indah",
    "location": "Cimalaka, Kab. Sumedang Jawa Barat",
    "association": "PT TRI KARYA LINGGA (ASPRUMNAS)",
    "link": Intro(),
  },
  {
    "image": "images/bg4.png",
    "name": "Perumahan Griya Caraka Indah",
    "location": "Cimalaka, Kab. Sumedang Jawa Barat",
    "association": "PT TRI KARYA LINGGA (ASPRUMNAS)",
    "link": RegisterSuccess(),
  },
  {
    "image": "images/bg4.png",
    "name": "Perumahan Griya Caraka Indah",
    "location": "Cimalaka, Kab. Sumedang Jawa Barat",
    "association": "PT TRI KARYA LINGGA (ASPRUMNAS)",
    "link": AlreadyRegistered(),
  },
  {
    "image": "images/bg4.png",
    "name": "Perumahan Griya Caraka Indah",
    "location": "Cimalaka, Kab. Sumedang Jawa Barat",
    "association": "PT TRI KARYA LINGGA (ASPRUMNAS)",
    "link": EditProfilForm(),
  },
  // {
  //   "image": "images/bg4.png",
  //   "name": "Perumahan Griya Caraka Indah",
  //   "location": "Cimalaka, Kab. Sumedang Jawa Barat",
  //   "association": "PT TRI KARYA LINGGA (ASPRUMNAS)",
  //   "link": Home(),
  // },
];

class _AllAvailableUnitsState extends State<AllAvailableUnits> {
  TextEditingController provinceControl = TextEditingController();
  final duplicateUnits = List<String>.generate(34, (i) => "Provinsi $i");
  var provinces = List<String>();
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
        provinces.clear();
        provinces.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        provinces.clear();
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: WaveBackground(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 200, 10, 0),
              child: SingleChildScrollView(
                child: Container(
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                    childAspectRatio: (1 / 1.64),
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: List<Widget>.generate(units.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => units[index]['link']),
                          );
                        },
                        child: GridTile(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  height: size.width / 2,
                                  decoration: BoxDecoration(
                                    color: Color(0xffc4c4c4),
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(units[index]['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AutoSizeText(
                                        units[index]['name'],
                                        style: title600Dark,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        presetFontSizes: [15, 10.75, 7.5],
                                      ),
                                      AutoSizeText(
                                        units[index]['location'],
                                        style: text400Grey,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        presetFontSizes: [12, 9, 6],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      AutoSizeText(
                                        units[index]['association'],
                                        style: text400Grey,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        presetFontSizes: [6, 4.5, 3],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
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
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                          'Galeri Perumahan',
                          textAlign: TextAlign.center,
                          style: title900Dark,
                          maxLines: 1,
                          presetFontSizes: [28, 21, 14],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: <Widget>[
                            TextField(
                              style: form200Light,
                              onChanged: (value) {
                                searchResults(value);
                              },
                              controller: provinceControl,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                filled: true,
                                isDense: true,
                                fillColor: Color(0xffF2F3F7),
                                hintText: 'Cari',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                                // contentPadding: EdgeInsets.only(left: 25),
                              ),
                            ),
                            Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: provinces.length >= 3
                                      ? 3
                                      : provinces.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: ListTile(
                                        dense: true,
                                        title: Text(
                                          '${provinces[index]}',
                                          style: form200Light,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
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
    );
  }
}
