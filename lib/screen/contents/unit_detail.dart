import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pakasep/screen/contents/filing_status.dart';
import 'package:pakasep/screen/contents/kpr_calc_simulations.dart';

import '../../utility/typhography.dart';

class UnitDetail extends StatefulWidget {
  final String idUnit;
  UnitDetail({Key key, this.idUnit}) : super(key: key);
  _UnitDetailState createState() => _UnitDetailState();
}

class _UnitDetailState extends State<UnitDetail> {
  GoogleMapController _mapControl;
  String _asosiasi,
      _email,
      _hargaText,
      _kecamatan,
      _kelurahan,
      _kota,
      _namaTempat,
      _perusahaan,
      _pemasaran,
      _provinsi,
      _telepon,
      _web;
  double _bunga, _lat, _lng, _tenor;
  int _harga, _kamar, _kamarMandi, _unit, _lt, _lb;
  List _deskripsi, _gambar = [];
  var _numberFormat = NumberFormat(",###.##", "id");

  @override
  Widget build(BuildContext context) {
    dynamic id = widget.idUnit;
    FirebaseFirestore.instance.collection("Rumah").doc(id).get().then(
      (DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          _asosiasi = documentSnapshot.data()["Asosiasi"];
          _deskripsi = documentSnapshot.data()["Deskripsi"];
          _email = documentSnapshot.data()["Email"];
          _gambar = documentSnapshot.data()["Foto"];
          _harga = documentSnapshot.data()["Deskripsi"][0]["Harga"];
          _hargaText = _numberFormat.format(_harga);
          _kamar = documentSnapshot.data()["Deskripsi"][0]["Kamar Tidur"];
          _kamarMandi = documentSnapshot.data()["Deskripsi"][0]["Kamar Mandi"];
          _kecamatan = documentSnapshot.data()["Kecamatan"];
          _kelurahan = documentSnapshot.data()["Kelurahan"];
          _kota = documentSnapshot.data()["Kota"];
          _lat = documentSnapshot.data()["Koordinat"].latitude;
          _lb = documentSnapshot.data()["Deskripsi"][0]["Luas Bangunan"];
          _lt = documentSnapshot.data()["Deskripsi"][0]["Luas Lahan"];
          _lng = documentSnapshot.data()["Koordinat"].longitude;
          _namaTempat = documentSnapshot.data()["Nama Perumahan"];
          _perusahaan = documentSnapshot.data()["Instansi"];
          _pemasaran = documentSnapshot.data()["Alamat Pemasaran"];
          _provinsi = documentSnapshot.data()["Provinsi"];
          _telepon = documentSnapshot.data()["Telepon"];
          _unit = documentSnapshot.data()["Unit Subsidi"];
          _web = documentSnapshot.data()["Website"];
          print(_deskripsi.toString());
          // if (documentSnapshot.data().containsKey("Deskripsi")) {

          // } else {
          //   print('Document does not exist on the database');
          // }
        } else {
          print('Document does not exist on the database');
        }
      },
    );

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight: size.height * 0.5,
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
              flexibleSpace: Stack(
                children: [
                  Container(
                    height: size.height * 0.36,
                    child: Carousel(
                      autoplay: false,
                      boxFit: BoxFit.cover,
                      dotBgColor: Colors.transparent,
                      dotColor: Color(0x88ffffff),
                      dotIncreasedColor: Theme.of(context).indicatorColor,
                      dotSize: 7,
                      dotIncreaseSize: 1.1,
                      showIndicator: true,
                      dotVerticalPadding: 20,
                      images: _gambar.map((gambar) {
                        print(gambar);
                        return CachedNetworkImage(
                          imageUrl: '$gambar',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        );
                      }).toList(),
                      onImageTap: (index) {
                        // var image_id = index + 1;
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: CachedNetworkImage(
                                  imageUrl: _gambar[index],
                                  fit: BoxFit.fitWidth,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: 1,
                    child: Container(
                      margin:
                          EdgeInsets.fromLTRB(0, size.height * 0.3 + 9, 0, 0),
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AutoSizeText.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Rp$_hargaText',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '/unit',
                                  style: TextStyle(
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                            style: text400Grey,
                            presetFontSizes: [14, 10.5, 7],
                          ),
                          Table(
                            columnWidths: {0: FlexColumnWidth(1)},
                            children: [
                              TableRow(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Icon(
                                            Icons.article_outlined,
                                            color:
                                                Theme.of(context).accentColor,
                                            size: 26,
                                          ),
                                        ),
                                        Flexible(
                                          child: FractionallySizedBox(
                                            widthFactor: 1,
                                            child: AutoSizeText.rich(
                                              TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: 'Tenor\n',
                                                    style: iconText400Dark,
                                                  ),
                                                  TextSpan(
                                                    text: 'Alamat',
                                                    // text: '$_tenor Tahun',
                                                    style: iconText600Dark,
                                                  ),
                                                ],
                                              ),
                                              maxLines: 2,
                                              presetFontSizes: [12, 10, 5],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Icon(
                                            Icons.money,
                                            color:
                                                Theme.of(context).accentColor,
                                            size: 26,
                                          ),
                                        ),
                                        Flexible(
                                          child: FractionallySizedBox(
                                            widthFactor: 1,
                                            // heightFactor: 1,
                                            child: AutoSizeText.rich(
                                              TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: 'Bunga\n',
                                                    style: iconText400Dark,
                                                  ),
                                                  TextSpan(
                                                    text: 'Alamat',
                                                    // text: '$_bunga% per Tahun',
                                                    style: iconText600Dark,
                                                  ),
                                                ],
                                              ),
                                              maxLines: 2,
                                              presetFontSizes: [12, 10, 5],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Icon(
                                            Icons.home_outlined,
                                            color:
                                                Theme.of(context).accentColor,
                                            size: 26,
                                          ),
                                        ),
                                        Flexible(
                                          child: AutoSizeText.rich(
                                            TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Unit\n',
                                                  style: iconText400Dark,
                                                ),
                                                TextSpan(
                                                  text: '$_unit Tersedia',
                                                  style: iconText600Dark,
                                                ),
                                              ],
                                            ),
                                            maxLines: 2,
                                            presetFontSizes: [12, 10, 5],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.6,
                            child: Table(
                              columnWidths: {0: FlexColumnWidth(1.5)},
                              children: [
                                TableRow(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.architecture,
                                            color:
                                                Theme.of(context).accentColor,
                                            size: 16,
                                          ),
                                          AutoSizeText(
                                            'LB $_lb / LT $_lt',
                                            style: iconText600Dark,
                                            presetFontSizes: [12, 10, 5],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.room,
                                            color:
                                                Theme.of(context).accentColor,
                                            size: 16,
                                          ),
                                          AutoSizeText(
                                            '$_kamarMandi',
                                            style: iconText600Dark,
                                            presetFontSizes: [12, 10, 5],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.single_bed,
                                            color:
                                                Theme.of(context).accentColor,
                                            size: 16,
                                          ),
                                          AutoSizeText(
                                            '$_kamar',
                                            style: iconText600Dark,
                                            presetFontSizes: [12, 10, 5],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.125),
                            child: Divider(
                              thickness: 0.75,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(20, size.height * 0.3 - 10, 20, 0),
                    padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 5),
                    width: size.width * 0.92,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AutoSizeText(
                      _namaTempat,
                      style: title700Light2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: AutoSizeText.rich(
                  TextSpan(
                    text:
                        '$_namaTempat berlokasi di $_kelurahan, Kec. $_kecamatan, $_kota, $_provinsi menyediakan $_unit unit perumahan subsidi dengan ${_deskripsi.length} tipe perumahan, yaitu:',
                  ),
                  style: text400Grey,
                  presetFontSizes: [13, 10, 5],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: ListView.builder(
                  itemCount: _deskripsi.length,
                  itemBuilder: (context, index) {
                    return AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Tipe ke-${index + 1} yaitu ${_deskripsi[index]["Tipe Rumah"]} dengan luas bangunan ${_deskripsi[index]["Luas Bangunan"]}m persegi dan luas lahan ${_deskripsi[index]["Luas Lahan"]}m persegi dijual dengan harga sekitar Rp${_numberFormat.format(_deskripsi[index]["Harga"])}. Menggunakan ${_deskripsi[index]["Atap"]} untuk pembuatan atap, spesifikasi dinding ${_deskripsi[index]["Dinding"]}, serta lantai dan pondasi yang dibangun menggunakan ${_deskripsi[index]["Lantai Pondasi"]}. Tipe ${_deskripsi[index]["Tipe Rumah"]} ini dilengkapi dengan ${_deskripsi[index]["Kamar Tidur"]} kamar tidur dan ${_deskripsi[index]["Kamar Mandi"]} kamar mandi.\n',
                          ),
                        ],
                      ),
                      style: text400Grey,
                      presetFontSizes: [13, 10, 5],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: AutoSizeText(
                        'Peta Lokasi',
                        presetFontSizes: [14, 10, 5],
                        style: text600Dark,
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 2 / 1.25,
                      child: Container(
                        child: GoogleMap(
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                          mapType: MapType.normal,
                          onMapCreated: (GoogleMapController controller) {
                            _mapControl = controller;
                          },
                          initialCameraPosition: CameraPosition(
                            zoom: 10,
                            // target: LatLng(_lat, _lng),
                            target: LatLng(0, 0),
                          ),
                          // markers: Set<Marker>.of(markers.values),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: AutoSizeText(
                        '$_kelurahan, $_kecamatan, $_kota, $_provinsi',
                        presetFontSizes: [12, 10, 5],
                        style: text400Grey,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.125),
                child: Divider(
                  thickness: 0.5,
                  height: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: _asosiasi == ""
                            ? '$_perusahaan'
                            : '$_perusahaan\n$_asosiasi',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nKANTOR PEMASARAN',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: _pemasaran == "" ? '' : '\n$_pemasaran',
                      ),
                      TextSpan(
                        text: _telepon == "" ? '' : '\n+62$_telepon',
                      ),
                      TextSpan(
                        text: _email == "" ? '' : '\n$_email',
                      ),
                      TextSpan(
                        text: _web == "" ? '' : '\n$_web',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: text400Dark,
                  presetFontSizes: [14, 10, 5],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                buttonHeight: 48,
                buttonMinWidth: size.width * 0.3,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KprCalcSimulation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      primary: Colors.white,
                      onPrimary: Theme.of(context).primaryColor,
                    ),
                    child: AutoSizeText(
                      'Simulasi KPR',
                      textAlign: TextAlign.center,
                      style: buttonTextDark,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FilingStatus()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Colors.white,
                    ),
                    child: AutoSizeText(
                      'Ajukan',
                      textAlign: TextAlign.center,
                      style: buttonTextLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
