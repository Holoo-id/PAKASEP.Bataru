import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/contents/all_available_units.dart';
import 'package:pakasep/screen/contents/filing_requirements.dart';
import 'package:pakasep/screen/contents/find_units.dart';
import 'package:pakasep/screen/contents/kpr_calc_simulations.dart';
import 'package:pakasep/utility/typhography.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  Widget _buildContructionAlert(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: FractionallySizedBox(
        heightFactor: 0.3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
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
                      text: 'Untuk informasi bisa di cek di ',
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 176 / 167,
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AllAvailableUnits(),
                ),
              );
            },
            child: GridTile(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Center(
                        child: FractionallySizedBox(
                          heightFactor: 0.79,
                          child: Image(
                            image: AssetImage(
                              'images/lihat semua perumahan.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    AutoSizeText(
                      'Lihat Semua Perumahan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      presetFontSizes: [18, 15, 10, 5],
                      maxLines: 2,
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
                  builder: (context) => FindUnits(),
                ),
              );
            },
            child: GridTile(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Center(
                        child: FractionallySizedBox(
                          heightFactor: 0.79,
                          child: Image(
                            image: AssetImage(
                              'images/telusuri rumah.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    AutoSizeText(
                      'Telusuri Perumahan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 15, 10, 5],
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Center(
                        child: FractionallySizedBox(
                          heightFactor: 0.79,
                          child: Image(
                            image: AssetImage(
                              'images/pengajuan.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    AutoSizeText(
                      'Persyaratan Pengajuan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 15, 10, 5],
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Center(
                        child: FractionallySizedBox(
                          heightFactor: 0.79,
                          child: Image(
                            image: AssetImage(
                              'images/cek status pengajuan.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    AutoSizeText(
                      'Cek Status Pengajuan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 15, 10, 5],
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Center(
                        child: FractionallySizedBox(
                          heightFactor: 0.79,
                          child: Image(
                            image: AssetImage(
                              'images/kalkulator.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: AutoSizeText(
                        'Kalkulator & Simulasi KPR',
                        style: text600Light,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        presetFontSizes: [18, 15, 10, 5],
                      ),
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: Center(
                        child: FractionallySizedBox(
                          heightFactor: 0.79,
                          child: Image(
                            image: AssetImage(
                              'images/panduan pengguna.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    AutoSizeText(
                      'Panduan Penggunaan',
                      style: text600Light,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      presetFontSizes: [18, 15, 10, 5],
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
