import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/typhography.dart';

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
  bool _hasChoose = false;

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
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight:
                  size.height > 512 ? size.height * 0.24 : size.height * 0.4,
              leadingWidth: 70,
              backgroundColor:
                  _hasChoose == false ? Colors.transparent : Colors.white,
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
              flexibleSpace: Container(
                width: size.width,
                child: WaveBackground(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 0.84,
                          child: AutoSizeText(
                            'Status Pengajuan',
                            textAlign: TextAlign.center,
                            style: title900Dark,
                            presetFontSizes: [28, 25, 20, 15, 10, 5],
                            maxLines: 1,
                          ),
                        ),
                        _hasChoose == true
                            ? FractionallySizedBox(
                                widthFactor: 0.81,
                                child: AutoSizeText(
                                  'Setelah memilih rumah dan mengajukan permohonan, data anda akan kami kirim ke bank untuk proses lanjutan.',
                                  style: text500Grey,
                                  textAlign: TextAlign.center,
                                  presetFontSizes: [16, 15, 10, 5],
                                ),
                              )
                            : Container(
                                height: 0,
                                width: 0,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.89,
                      child: _fillProcess(),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.76,
                      child: AutoSizeText(
                        'Selamat Anda Punya Rumah!',
                        style: title600Dark,
                        textAlign: TextAlign.center,
                        presetFontSizes: [20, 15, 10, 5],
                      ),
                    ),
                    Image.asset(
                      'images/r3.png',
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AutoSizeText(
                                  'Proses selesai (lanjut tahap berikutnya)',
                                  style: subName400Dark,
                                  presetFontSizes: [12, 10, 5],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xff851414),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AutoSizeText(
                                  'Tidak lolos',
                                  style: subName400Dark,
                                  presetFontSizes: [12, 10, 5],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AutoSizeText(
                                  'Sedang di proses',
                                  style: subName400Dark,
                                  presetFontSizes: [12, 10, 5],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FractionallySizedBox(
            widthFactor: 0.7,
            child: AutoSizeText(
              'BELUM MEMILIH RUMAH',
              style: title700Red,
              presetFontSizes: [24, 20, 15, 10, 5],
              textAlign: TextAlign.center,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.85,
            child: AutoSizeText(
              'Silahkan memilih rumah terlebih dahulu sebelum melanjutkan ke proses pengajuan',
              style: text500Grey,
              presetFontSizes: [16, 15, 10, 5],
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
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
              'Pilih Rumah',
              textAlign: TextAlign.center,
              style: buttonTextDark,
            ),
          ),
        ],
      ),
    );
  }
}
