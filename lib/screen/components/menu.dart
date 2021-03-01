import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/contents/filing_requirements.dart';
import 'package:pakasep/screen/contents/kpr_calc_simulations.dart';
import 'package:pakasep/utility/style.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  Widget _buildContructionAlert(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height / 4,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'aplikasi masih dalam tahap pra-registrasi. silahkan input data anda terlebih dahulu\n'
                    .toUpperCase(),
                textAlign: TextAlign.center,
                presetFontSizes: [20, 18],
                style: text600Dark,
              ),
              AutoSizeText.rich(
                TextSpan(
                  style: text400Grey,
                  children: [
                    TextSpan(
                      text: 'Untuk informasi bisa di cek di Int',
                    ),
                    TextSpan(
                        style: text500Grey,
                        text: ' https://www.instagram.com/bataru.pakasep/',
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () async {
                            const _url =
                                'https://www.instagram.com/bataru.pakasep/';
                            if (await canLaunch(_url)) {
                              await launch(_url);
                            } else {
                              throw 'Tidak dapat membuka $_url';
                            }
                          }),
                  ],
                ),
                presetFontSizes: [16, 15],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (176.45 / 168),
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildContructionAlert(context);
              },
            ),
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
                          'images/lihat semua perumahan.png',
                        ),
                        height: 85.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      'Lihat Semua Perumahan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 13.5, 9],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildContructionAlert(context);
              },
            ),
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
                          'images/telusuri rumah.png',
                        ),
                        height: 85.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      'Telusuri Perumahan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 13.5, 9],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilingRequirements(),
                ),
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
                          'images/pengajuan.png',
                        ),
                        height: 85.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      'Persyaratan Pengajuan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 13.5, 9],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildContructionAlert(context);
              },
            ),
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
                          'images/cek status pengajuan.png',
                        ),
                        height: 85.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      'Cek Status Pengajuan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 13.5, 9],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KprCalcSimulation(),
                ),
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
                          'images/kalkulator.png',
                        ),
                        height: 85.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      'Kalkulator & Simulasi KPR',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 13.5, 9],
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return _buildContructionAlert(context);
              },
            ),
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
                          'images/panduan pengguna.png',
                        ),
                        height: 85.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      'Panduan Penggunaan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 13.5, 9],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
