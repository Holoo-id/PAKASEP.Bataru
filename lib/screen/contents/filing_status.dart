import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/style.dart';

class FilingStatus extends StatefulWidget {
  @override
  _FilingStatusState createState() => _FilingStatusState();
}

// dapat diedit sesuai db
var _process = [
  {
    "process": "Kirim Data",
    "status": "selesai",
  },
  {
    "process": "Pengecekan SLIK (BI Checking)",
    "status": "selesai",
  },
  {
    "process": "Verifikasi Bank",
    "status": "selesai",
  },
  {
    "process": "Pencairan Dana FLPP",
    "status": "diproses",
  },
  {
    "process": "Tunggu Konfirmasi",
    "status": "gagal",
  },
];

class _FilingStatusState extends State<FilingStatus> {
  bool _hasChoose = true;

  Widget _fillProcess() {
    List<Widget> list = new List<Widget>();
    Color _color;
    for (var i = 0; i < _process.length; i++) {
      print(i);
      switch (_process[i]['status']) {
        case 'selesai':
          _color = Theme.of(context).accentColor;
          break;
        case 'gagal':
          _color = Color(0xff851414);
          break;
        default:
          _color = Theme.of(context).primaryColor;
          break;
      }
      list.add(
        Column(
          children: [
            Container(
              height: 40,
              width: 350,
              padding: EdgeInsets.symmetric(vertical: 7.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: _color,
              ),
              child: AutoSizeText(
                _process[i]['process'].toString(),
                textAlign: TextAlign.center,
                style: title700Light,
                presetFontSizes: [16, 12, 8],
              ),
            ),
            i % 2 == 1
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(22 / 7),
                    child: Image.asset('images/l1.png'),
                  )
                : Image.asset('images/l1.png'),
          ],
        ),
      );
    }
    return Column(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight: 180,
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
                          'Status Pengajuan',
                          textAlign: TextAlign.center,
                          style: title900Dark,
                          maxLines: 1,
                          presetFontSizes: [28, 21, 14],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AutoSizeText(
                          'Setelah memilih rumah dan mengajukan permohonan, data anda akan kami kirim ke bank untuk proses lanjutan.',
                          style: text500Grey,
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          presetFontSizes: [16, 12, 8],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: _hasChoose == true
            ? SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _fillProcess(),
                    AutoSizeText(
                      'Selamat Anda Punya Rumah!',
                      style: title600Dark,
                      textAlign: TextAlign.center,
                      presetFontSizes: [20, 15, 10],
                    ),
                    Image.asset(
                      'images/r3.png',
                      fit: BoxFit.fitWidth,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              color: Theme.of(context).accentColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AutoSizeText(
                              'Proses selesai (lanjut tahap berikutnya)',
                              style: subName400Dark,
                              // presetFontSizes: [12, 9, 6],
                              maxLines: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              color: Color(0xff851414),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AutoSizeText(
                              'Tidak lolos',
                              style: subName400Dark,
                              // presetFontSizes: [12, 9, 6],
                              maxLines: 1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AutoSizeText(
                              'Sedang di proses',
                              style: subName400Dark,
                              // presetFontSizes: [12, 9, 6],
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : _buildNotChooseYet(),
      ),
    );
  }

  Widget _buildNotChooseYet() {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            'BELUM MEMILIH RUMAH',
            style: title700Red,
            maxLines: 1,
            presetFontSizes: [24, 18, 12],
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15,
          ),
          AutoSizeText(
            'Silahkan memilih rumah terlebih dahulu sebelum melanjutkan ke proses pengajuan',
            style: text500Grey,
            maxLines: 2,
            presetFontSizes: [16, 12, 8],
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 60,
          ),
          RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                width: 2,
                color: Theme.of(context).primaryColor,
              ),
            ),
            color: Colors.white,
            child: AutoSizeText(
              'Pilih Rumah',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: buttonTextDark,
            ),
          ),
        ],
      ),
    );
  }
}
