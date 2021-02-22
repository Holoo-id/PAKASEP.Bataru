import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/contents/unit_detail.dart';
import 'package:pakasep/utility/style.dart';

class AllAvailableUnits extends StatefulWidget {
  @override
  AllAvailableUnits({Key key}) : super(key: key);
  _AllAvailableUnitsState createState() => _AllAvailableUnitsState();
}

class _AllAvailableUnitsState extends State<AllAvailableUnits> {
  String associationsChoose;
  String citiesChoose;
  String districtsChoose;
  String filterValue = 'Terbaru';
  String provincesChoose;
  List associationsItem = [
    "ASPRUMNAS",
    "Tri Karya Lingga",
  ];
  List citiesItem = [
    "Bandung",
    "Bogor",
    "Ciamis",
    "Cimahi",
    "Depok",
    "Sumedang",
  ];
  List districtsItem = [
    "Cimahi Selatan",
    "Cimahi Tengah",
    "Cimahi Utara",
  ];
  List provincesItem = [
    "Banten",
    "DKI Jakarta",
    "DIY Yogyakarta",
    "Jawa Barat",
    "Jawa Tengah",
    "Jawa Timur",
  ];
  @override
  void initState() {
    super.initState();
  }

  Widget _buildAssociations() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF2F3F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonFormField(
        value: associationsChoose,
        onChanged: (newValue) {
          setState(() {
            associationsChoose = newValue;
          });
        },
        items: associationsItem.map((associationItem) {
          return DropdownMenuItem<String>(
            value: associationItem,
            child: AutoSizeText(associationItem),
          );
        }).toList(),
        hint: AutoSizeText(
          'Pilih Asosiasi',
          style: text400Dark,
        ),
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        style: text400Grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCities() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF2F3F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonFormField(
        value: citiesChoose,
        onChanged: (newValue) {
          setState(() {
            citiesChoose = newValue;
          });
        },
        items: citiesItem.map((cityItem) {
          return DropdownMenuItem<String>(
            value: cityItem,
            child: AutoSizeText(cityItem),
          );
        }).toList(),
        hint: AutoSizeText(
          'Kabupaten/Kota',
          style: text400Dark,
        ),
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        style: text400Grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDistricts() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF2F3F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonFormField(
        value: districtsChoose,
        onChanged: (newValue) {
          setState(() {
            districtsChoose = newValue;
          });
        },
        items: districtsItem.map((districtItem) {
          return DropdownMenuItem<String>(
            value: districtItem,
            child: AutoSizeText(districtItem),
          );
        }).toList(),
        hint: AutoSizeText(
          'Pilih Kecamatan',
          style: text400Dark,
        ),
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        style: text400Grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildProvinces() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffF2F3F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonFormField(
        value: provincesChoose,
        onChanged: (newValue) {
          setState(() {
            provincesChoose = newValue;
          });
        },
        items: provincesItem.map((provinceItem) {
          return DropdownMenuItem<String>(
            value: provinceItem,
            child: AutoSizeText(provinceItem),
          );
        }).toList(),
        hint: AutoSizeText(
          'Pilih Provinsi',
          style: text400Dark,
        ),
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        style: text400Grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight: size.height * 0.25,
              // toolbarHeight: 400,
              leadingWidth: 70,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              floating: true,
              pinned: true,
              snap: false,
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
                  : Container(),
              centerTitle: true,
              flexibleSpace: Container(
                // margin: EdgeInsets.only(top: 50),
                width: size.width,
                height: size.height * 0.315,
                // height: 400,
                color: Colors.white,
                child: WaveBackground(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(
                        //   height: 40,
                        // ),
                        AutoSizeText(
                          'Galeri Perumahan',
                          textAlign: TextAlign.center,
                          style: title900Dark,
                          maxLines: 1,
                          presetFontSizes: [28, 21, 14],
                        ),
                        GridView.count(
                          primary: false,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: (1 / 0.25),
                          children: <Widget>[
                            _buildProvinces(),
                            _buildCities(),
                            _buildDistricts(),
                            _buildAssociations(),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF2F3F7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButtonFormField(
                            value: filterValue,
                            onChanged: (newFilter) {
                              setState(() {
                                filterValue = newFilter;
                              });
                            },
                            items: <String>['Terbaru', 'Termurah', 'Terbanyak']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: AutoSizeText(value),
                              );
                            }).toList(),
                            hint: AutoSizeText(
                              'Urutkan Berdasarkan',
                              style: text400Dark,
                            ),
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down_sharp),
                            style: text400Grey,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Rumah").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data.docs;
              return GridView(
                children: documents
                    .map((doc) => Card(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // builder: (context) => units[index]['link'],
                                    ),
                              );
                            },
                            child: GridTile(
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: size.width / 2,
                                      decoration: BoxDecoration(
                                        color: Color(0xffc4c4c4),
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'images/r1.png',
                                            // units[index]['image'],
                                          ),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AutoSizeText(
                                            doc["nama_tempat"],
                                            style: title600Dark,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            presetFontSizes: [15, 10.75, 7.5],
                                          ),
                                          AutoSizeText(
                                            doc["alamat"],
                                            style: text400Grey,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            presetFontSizes: [12, 9, 6],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          AutoSizeText(
                                            doc["asosiasi"],
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
                          ),
                          // child: ListTile(
                          //   title: Text(doc["nama_tempat"]),
                          //   subtitle: Text(doc["alamat"]),
                          // ),
                        ))
                    .toList(),
              );
            } else {
              print('Terjadi Kesalahan');
              CircularProgressIndicator();
            }
          },
        ),
        // body: SingleChildScrollView(
        //   padding: EdgeInsets.symmetric(horizontal: 10),
        //   child: Container(
        //     child: GridView.count(
        //       crossAxisSpacing: 10,
        //       mainAxisSpacing: 10,
        //       crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
        //       childAspectRatio: (1 / 1.64),
        //       controller: new ScrollController(keepScrollOffset: false),
        //       shrinkWrap: true,
        //       scrollDirection: Axis.vertical,
        //       children: List<Widget>.generate(units.length, (index) {
        //         return GestureDetector(
        //           onTap: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => units[index]['link']),
        //             );
        //           },
        //           child: GridTile(
        //             child: Container(
        //               child: Column(
        //                 children: [
        //                   Container(
        //                     height: size.width / 2,
        //                     decoration: BoxDecoration(
        //                       color: Color(0xffc4c4c4),
        //                       borderRadius: BorderRadius.circular(8),
        //                       image: DecorationImage(
        //                         image: AssetImage(units[index]['image']),
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.all(10),
        //                     child: Column(
        //                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       children: [
        //                         AutoSizeText(
        //                           units[index]['name'],
        //                           style: title600Dark,
        //                           textAlign: TextAlign.center,
        //                           maxLines: 2,
        //                           presetFontSizes: [15, 10.75, 7.5],
        //                         ),
        //                         AutoSizeText(
        //                           units[index]['location'],
        //                           style: text400Grey,
        //                           textAlign: TextAlign.center,
        //                           maxLines: 2,
        //                           presetFontSizes: [12, 9, 6],
        //                         ),
        //                         SizedBox(
        //                           height: 5,
        //                         ),
        //                         AutoSizeText(
        //                           units[index]['association'],
        //                           style: text400Grey,
        //                           textAlign: TextAlign.center,
        //                           maxLines: 1,
        //                           presetFontSizes: [6, 4.5, 3],
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       }),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
