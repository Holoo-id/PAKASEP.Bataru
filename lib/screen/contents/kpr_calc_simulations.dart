import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/style.dart';

class KprCalcSimulation extends StatefulWidget {
  @override
  _KprCalcSimulationState createState() => _KprCalcSimulationState();
}

class _KprCalcSimulationState extends State<KprCalcSimulation> {
  String _dpPercent;
  String _hargaRumah;
  String _jangkaWaktu;
  String _sukuBungaEfektif;
  String _uangMuka;
  bool pressed = false;

  Widget _buildHargaRumah() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onSaved: (String harga) {
          _hargaRumah = harga;
        },
        style: form200Light,
        decoration: InputDecoration(
          hintText: 'Harga Rumah',
          labelText: 'Harga Rumah',
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          prefixText: 'Rp',
          prefixStyle: text600Dark,
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }

  Widget _buildJangkaWaktu() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onSaved: (String waktu) {
          _jangkaWaktu = waktu;
        },
        style: form200Light,
        decoration: InputDecoration(
          hintText: 'Jangka Waktu',
          labelText: 'Jangka Waktu',
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          prefixText: 'Thn',
          prefixStyle: text600Dark,
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }

  Widget _buildPercentage() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onSaved: (String percent) {
          _dpPercent = percent;
        },
        style: form200Light,
        decoration: InputDecoration(
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          suffixText: '%',
          suffixStyle: text600Dark,
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }

  Widget _buildSukuBungaEfektif() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onSaved: (String bunga) {
          _sukuBungaEfektif = bunga;
        },
        style: form200Light,
        decoration: InputDecoration(
          hintText: 'Suku Bunga Efektif',
          labelText: 'Suku Bunga',
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          prefixText: '%',
          prefixStyle: text600Dark,
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }

  Widget _buildUangMuka() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onSaved: (String uangMuka) {
          _uangMuka = uangMuka;
        },
        style: form200Light,
        decoration: InputDecoration(
          hintText: 'Uang Muka / DP',
          labelText: 'Uang Muka',
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          prefixText: 'Rp',
          prefixStyle: text600Dark,
          contentPadding: EdgeInsets.all(10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(width: 0, style: BorderStyle.none),
          ),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              toolbarHeight: 130,
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
                          'Kalkulator KPR\nSimulasi KPR',
                          textAlign: TextAlign.center,
                          style: title900Dark,
                          maxLines: 2,
                          presetFontSizes: [28, 21, 14],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildHargaRumah(),
                    _buildUangMuka(),
                    _buildPercentage(),
                    _buildJangkaWaktu(),
                    _buildSukuBungaEfektif(),
                    RaisedButton(
                      onPressed: () {
                        pressed = true;
                        _formKey.currentState.save();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      color: Theme.of(context).primaryColor,
                      child: AutoSizeText(
                        'Hitung',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: buttonTextLight,
                      ),
                    ),
                  ],
                ),
              ),
              AutoSizeText(
                'Hasil Perhitungan',
                style: title600Dark,
                maxLines: 1,
                presetFontSizes: [24, 18, 12],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'HARGA RUMAH',
                    style: formTitle700Dark,
                    maxLines: 1,
                    presetFontSizes: [12, 8, 6],
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      pressed == true ? 'Rp$_hargaRumah' : '',
                      style: text600Light,
                    ),
                  ),
                  AutoSizeText(
                    'ANGSURAN PER BULAN [36 BULAN PERTAMA]',
                    style: formTitle700Dark,
                    maxLines: 1,
                    presetFontSizes: [12, 8, 6],
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  AutoSizeText(
                    'UANG MUKA YANG HARUS DISIAPKAN',
                    style: formTitle700Dark,
                    maxLines: 1,
                    presetFontSizes: [12, 8, 6],
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      pressed == true ? 'Rp$_uangMuka' : '',
                      style: text600Light,
                    ),
                  ),
                  AutoSizeText(
                    'POKOK PINJAMAN',
                    style: formTitle700Dark,
                    maxLines: 1,
                    presetFontSizes: [12, 8, 6],
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  AutoSizeText(
                    'TOTAL BUNGA',
                    style: formTitle700Dark,
                    maxLines: 1,
                    presetFontSizes: [12, 8, 6],
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  AutoSizeText(
                    'TOTAL PINJAMAN',
                    style: formTitle700Dark,
                    maxLines: 1,
                    presetFontSizes: [12, 8, 6],
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).primaryColor,
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
