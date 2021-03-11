import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/contents/unit_detail.dart';
import 'package:pakasep/utility/typhography.dart';

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
    "Semua",
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

  //global key
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //global key

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference units = FirebaseFirestore.instance.collection("Rumah");
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight: size.height * 0.25,
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
                  : Container(height: 0, width: 0),
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 0.92,
                          child: AutoSizeText(
                            'Galeri Perumahan',
                            textAlign: TextAlign.center,
                            style: title900Dark,
                            presetFontSizes: [28, 25, 20, 15, 10, 5],
                            maxLines: 1,
                          ),
                        ),
                        GridView.count(
                          primary: false,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 0.25,
                          children: <Widget>[
                            _buildProvinces(),
                            _buildCities(),
                            _buildDistricts(),
                            _buildAssociations(),
                          ],
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
          stream: units
              .where("asosiasi", isEqualTo: associationsChoose)
              .where("kota", isEqualTo: citiesChoose)
              .where("kecamatan", isEqualTo: districtsChoose)
              .where("provinsi", isEqualTo: provincesChoose)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('Terjadi Kesalahan');
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            print(provincesChoose);
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                print('No Data');
                break;
              case ConnectionState.waiting:
                print('Loading...');
                Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                if (snapshot.hasData) {}
                break;
            }
            final List<DocumentSnapshot> documents = snapshot.data.docs;
            return Container(
              height: size.height,
              padding: EdgeInsets.all(15),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1 / 2,
                ),
                children: documents
                    .map(
                      (doc) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UnitDetail(
                                idUnit: doc.id,
                              ),
                            ),
                          );
                        },
                        child: GridTile(
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: doc["gambar"][0],
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AutoSizeText(
                                        doc["nama_tempat"],
                                        style: title600Dark,
                                        textAlign: TextAlign.center,
                                        presetFontSizes: [16, 15, 10, 5],
                                      ),
                                      AutoSizeText(
                                        doc["alamat"],
                                        style: text400Grey,
                                        textAlign: TextAlign.center,
                                        presetFontSizes: [12, 10, 5],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      AutoSizeText(
                                        doc["asosiasi"],
                                        style: text400Grey,
                                        textAlign: TextAlign.center,
                                        presetFontSizes: [8, 5],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
