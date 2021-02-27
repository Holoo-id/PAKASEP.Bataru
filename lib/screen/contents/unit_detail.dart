import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/contents/filing_status.dart';
import 'package:pakasep/screen/contents/kpr_calc_simulations.dart';

import '../../utility/style.dart';

class UnitDetail extends StatefulWidget {
  @override
  String idUnit;
  UnitDetail({Key key, this.idUnit}) : super(key: key);
  _UnitDetailState createState() => _UnitDetailState();
}

class _UnitDetailState extends State<UnitDetail> {
  String _alamat,
      _asosiasi,
      _deskripsi,
      _email,
      _namaTempat,
      _perusahaan,
      _telepon,
      _ukuran,
      _web;
  double _bunga, _tenor;
  int _kamar, _kamarMandi, _unit;
  List _gambar = [];
  // CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    dynamic id = widget.idUnit;
    FirebaseFirestore.instance.collection("Rumah").doc(id).get().then(
      (DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          _alamat = documentSnapshot.data()["alamat"];
          _asosiasi = documentSnapshot.data()["asosiasi"];
          _bunga = documentSnapshot.data()["bunga"];
          _deskripsi = documentSnapshot.data()["deskripsi"];
          _email = documentSnapshot.data()["kontak.email"];
          _gambar = documentSnapshot.data()["gambar"];
          _kamar = documentSnapshot.data()["kamar"];
          _kamarMandi = documentSnapshot.data()["kamar_mandi"];
          _namaTempat = documentSnapshot.data()["nama_tempat"];
          _perusahaan = documentSnapshot.data()["perusahaan"];
          _telepon = documentSnapshot.data()["kontak.telepon"];
          _tenor = documentSnapshot.data()["tenor"] / 12;
          _ukuran = documentSnapshot.data()["ukuran"];
          _unit = documentSnapshot.data()["unit"];
          _web = documentSnapshot.data()["kontak.web"];
          // print(documentSnapshot.data()["kontak.email"]);
          // print(documentSnapshot.data()["kontak.telepon"]);
          // print(documentSnapshot.data()["kontak.web"]);
          print(documentSnapshot.data()["kontak"]);
        } else {
          print('Document does not exist on the database');
        }
      },
    );

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
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
                    height: size.height * 0.33,
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
                        var image_id = index + 1;
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
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
                  Container(
                    margin: EdgeInsets.fromLTRB(0, size.height * 0.3 + 9, 0, 0),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    height: size.height > 800 ? size.height * 0.25 : 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Rp200.000.000,00',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width * 0.3,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.article_outlined,
                                    color: Theme.of(context).accentColor,
                                    size: 40,
                                  ),
                                  AutoSizeText.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Tenor\n',
                                          style: iconText400Dark,
                                        ),
                                        TextSpan(
                                          text: '$_tenor Tahun',
                                          style: iconText600Dark,
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    presetFontSizes: [12, 9, 6],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.3,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.money,
                                    color: Theme.of(context).accentColor,
                                    size: 40,
                                    // size: size.width > 480 ? 40 : 0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'Bunga',
                                        maxLines: 1,
                                        presetFontSizes: [12, 9, 6],
                                        style: iconText400Dark,
                                      ),
                                      AutoSizeText(
                                        '$_bunga% per Tahun',
                                        maxLines: 1,
                                        presetFontSizes: [12, 9, 6],
                                        style: iconText600Dark,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.3,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home_outlined,
                                    color: Theme.of(context).accentColor,
                                    size: 40,
                                    // size: size.width > 480 ? 40 : 0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        'Unit',
                                        maxLines: 1,
                                        presetFontSizes: [12, 9, 6],
                                        style: iconText400Dark,
                                      ),
                                      AutoSizeText(
                                        '$_unit Tersedia',
                                        maxLines: 1,
                                        presetFontSizes: [12, 9, 6],
                                        style: iconText600Dark,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.architecture,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  AutoSizeText(
                                    '30x60',
                                    maxLines: 1,
                                    style: iconText600Dark,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.room,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  AutoSizeText(
                                    // '1',
                                    _kamarMandi.toString(),
                                    maxLines: 1,
                                    style: iconText600Dark,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.single_bed,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  AutoSizeText(
                                    // '1',
                                    _kamar.toString(),
                                    maxLines: 1,
                                    style: iconText600Dark,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 65),
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
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(20, size.height * 0.3 - 10, 20, 0),
                    padding: EdgeInsets.symmetric(vertical: 7.5),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: AutoSizeText(
                      _namaTempat,
                      // 'Perumahan Griya Caraka Indah',
                      style: title700Light2,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                AutoSizeText.rich(
                  TextSpan(
                    text: _deskripsi,
                    // children: <TextSpan>[
                    //   TextSpan(
                    //     text:
                    //         'Podomoro River View adalah perumahan dengan konsep garden house yang dikembangkan PT. Agung Podomoro Land Tbk. Terletak di Gunung Putri, Bogor, perumahan ini menawarkan desain yang cantik dan minimalis sehingga ideal dijadikan rumah keluarga.\n',
                    //   ),
                    //   TextSpan(
                    //     text:
                    //         '\nPodomoro River View memiliki sejumlah fasilitas memadai seperti:\n',
                    //   ),
                    //   TextSpan(
                    //     text:
                    //         '• Club House\n• Gym\n• Jogging Track\n• Kolam Renang\n• Keamanan\n• One Gate System\n• Masjid\n• Ruang Komunitas\n',
                    //   ),
                    //   TextSpan(
                    //     text:
                    //         '\nTak hanya fasilitas yang mumpuni, Podomoro River View terletak di lokasi strategis. Perumahan di Bogor ini dikelilingi area dan akses penting dengan jarak temuh yang dekat seperti:\n',
                    //   ),
                    //   TextSpan(
                    //     text:
                    //         '• 12 menit ke Exit Tol Cimanggis 3\n• 20 menit ke Stasiun LRT\n• 25 menit ke Bandara Halim Perdanakusuma\n• 25 menit ke Universitas Guadarma\n• 30 menit ke Tol Jagorawi\n',
                    //   ),
                    //   TextSpan(
                    //     text:
                    //         '\nPodomoro River View pun memiliki sejumlah unit yang tersedia dengan spesifikasi berbeda dengan harga mulai dari Rp 1,5 miliar. Podomoro River Vew dengan konsep hunian hijau yang asri dapat menjadi pilihan menarik hanya untuk Anda\n',
                    //   ),
                    // ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 65),
                  child: Divider(
                    thickness: 0.5,
                    height: 35,
                  ),
                ),
                AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$_perusahaan\n$_asosiasi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '\nKANTOR PEMASARAN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '\n$_alamat',
                      ),
                      TextSpan(
                        text: '\n$_telepon',
                      ),
                      TextSpan(
                        text: '\n$_email',
                      ),
                      TextSpan(
                        text: '\n$_web',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: text400Dark,
                  presetFontSizes: [14, 10.5, 7],
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  buttonHeight: 48,
                  buttonMinWidth: size.width * 0.3,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KprCalcSimulation()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      color: Colors.white,
                      child: AutoSizeText(
                        'Simulasi KPR',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: buttonTextDark,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilingStatus()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      child: AutoSizeText(
                        'Ajukan',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: buttonTextLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
