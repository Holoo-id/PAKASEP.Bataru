import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/contents/all_available_units.dart';
import 'package:pakasep/screen/contents/filing_requirements.dart';
import 'package:pakasep/screen/contents/filing_status.dart';
import 'package:pakasep/screen/contents/find_units.dart';
import 'package:pakasep/screen/contents/kpr_calc_simulations.dart';
import 'package:pakasep/screen/users/user_guide.dart';
import 'package:pakasep/utility/style.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  Widget _buildContructionAlert(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // contentTextStyle: buttonTextLight,
      // actions: [
      //   RaisedButton(
      //     onPressed: () => Navigator.of(context).pop(),
      //     color: Theme.of(context).primaryColor,
      //     child: Text('tutup'),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(5),
      //     ),
      //   )
      // ],
      // titlePadding: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(
          'aplikasi masih dalam tahap pra-registrasi. silahkan input data anda terlebih dahulu'.toUpperCase(),
          textAlign: TextAlign.center,
          maxFontSize: 30,
          minFontSize: 16,
          style: text800Dark,
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
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => AllAvailableUnits(),
            //     ),
            //   );
            // },
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilingStatus(),
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserGuide(),
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
