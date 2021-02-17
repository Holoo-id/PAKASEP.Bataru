import 'dart:io' show Platform;
import 'dart:math';
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
  // String _pokokPinjaman ;
  String _angsuranPerbulan ;
  String _totalBunga;
  String _totalPinjaman;

  var _dpPercentController = TextEditingController();
  var _uangMukaController = TextEditingController();
  var _hargaRumahController = TextEditingController();
  var _sukuBungaEfektifController = TextEditingController();
  var _jangkaWaktuController = TextEditingController();

  var _detailHargaRumahController = TextEditingController();
  var _detailUangMukaController = TextEditingController();
  var _detailPokokPinjamanController = TextEditingController();
  var _detailAngsuranPerbulanController = TextEditingController();
  var _detailTotalBungaController = TextEditingController();
  var _detailTotalPinjamanController = TextEditingController();

  bool pressed = false;

  Widget _formInput() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xF2F3F7FF),
              ),
              child: TextFormField(
                controller: _hargaRumahController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (String hargaRumah){
                  if(_dpPercentController.text != '') {
                    var percent = double.parse(_dpPercentController.text) / 100;
                    var uangMuka = int.parse(hargaRumah) * percent;

                    _uangMukaController.text = uangMuka.toStringAsFixed(0);
                  }
                  if(_uangMukaController.text != ''){
                    var uangMuka = double.parse(_uangMukaController.text);
                    var percent = uangMuka / int.parse(hargaRumah) * 100;
                    _dpPercentController.text = (percent < 1 && percent > 0.01) ? percent.toStringAsFixed(2) : percent.toStringAsFixed(0);
                  }
                },
                onSaved: (String value) {
                  _hargaRumah = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Harga Rumah',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                  icon: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      margin: EdgeInsets.all(0),
                      alignment: Alignment.center,
                      height: 45,
                      width: 45,
                      padding: EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xECECECFF),
                      ),
                      child: Text("RP", style: text800Dark),
                    ),
                  ),
                ),
              )
          ),
          Table(
            columnWidths: {
              0 : FlexColumnWidth(2)
            },
            children: [
              TableRow(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xF2F3F7FF),
                          ),
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            controller: _uangMukaController,
                            onChanged: (String uangMuka){
                              _uangMuka = uangMuka;
                              var harga = _hargaRumahController.text;
                              var dpPercent = (int.parse(uangMuka) / int.parse(harga)) * 100;
                              _dpPercentController.text = ( dpPercent < 1 && dpPercent > 0.01 ) ? dpPercent.toStringAsFixed(2) : dpPercent.toStringAsFixed(0);
                            },
                            onSaved: (String uangMuka) {
                              _uangMuka = uangMuka;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Uang Muka / DP',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                              icon: Padding(
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  margin: EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: 45,
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xECECECFF),
                                  ),
                                  child: Text("RP", style: text800Dark),
                                ),
                              ),
                            ),
                          )
                      ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xF2F3F7FF),
                      ),
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Table(
                        columnWidths: {
                          0: FlexColumnWidth(2)
                        },
                        children: [
                          TableRow(
                            children: [
                              TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: _dpPercentController,
                                onChanged: (String dpPercent){

                                  if(dpPercent == ''){

                                    _uangMukaController.text = '0';

                                  }else{

                                    _dpPercent = dpPercent;

                                    var percent = double.parse(dpPercent);
                                    var hargaRumah = int.parse(_hargaRumahController.text);

                                    var dp = ((percent / 100) * hargaRumah);

                                    _uangMukaController.text = dp.toStringAsFixed(0);
                                    // _dpPercentController.text = ( percent < 1 && percent > 0.01 ) ? percent.toStringAsFixed(2) : percent.toStringAsFixed(0);
                                  }
                                },
                                onSaved: (String dpPercent) {
                                  _dpPercent = dpPercent;
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(0),
                                alignment: Alignment.center,
                                height: 45,
                                width: 45,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xECECECFF),
                                ),
                                child: Text("%", style: text800Dark),
                              ),
                            ],

                          )
                        ],
                      )
                  ),
                ]
              )
            ],
          ),
          Table(
            columnWidths: {
              0 : FlexColumnWidth(1)
            },
            children: [
              TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xF2F3F7FF),
                          ),
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: TextFormField(
                            controller: _jangkaWaktuController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (String jangkaWaktu) {
                              _jangkaWaktu = jangkaWaktu;
                            },
                            onSaved: (String jangkaWaktu) {
                              _jangkaWaktu = jangkaWaktu;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Jangka Waktu',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                              icon: Padding(
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  margin: EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  height: 45,
                                  width: 45,
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xECECECFF),
                                  ),
                                  child: Text("Thn", style: text800Dark),
                                ),
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xF2F3F7FF),
                        ),
                        padding: EdgeInsets.all(0),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          controller: _sukuBungaEfektifController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (String sukuBungaEfektif) {
                            _sukuBungaEfektif = sukuBungaEfektif;
                          },
                          onSaved: (String sukuBungaEfektif) {
                            _sukuBungaEfektif = sukuBungaEfektif;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Suku Bunga Efektif',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                            icon: Padding(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                margin: EdgeInsets.all(0),
                                alignment: Alignment.center,
                                height: 45,
                                width: 45,
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xECECECFF),
                                ),
                                child: Text("%", style: text800Dark),
                              ),
                            ),
                          ),
                        )
                    ),
                  ]
              )
            ],
          ),
          RaisedButton(
            onPressed: () {
              pressed = true;
              double pokokPinjaman = (double.parse(_hargaRumahController.text) - double.parse(_uangMukaController.text));
              int totalJangkaWaktu = int.parse(_jangkaWaktuController.text) * 12;
              double angsuranPerbulan = pokokPinjaman * double.parse(_sukuBungaEfektifController.text) / 100 * double.parse(_jangkaWaktuController.text) / totalJangkaWaktu;

              var intr = int.parse(_sukuBungaEfektifController.text) / 1200;
              // var cicilan = (int.parse(_hargaRumahController.text) * intr / (1 - ( pow(1 / (1 + intr), totalJangkaWaktu))));
              var cicilan = (int.parse(_hargaRumahController.text) - int.parse(_uangMukaController.text)) * intr / (1 - (pow(1/(1 + intr), totalJangkaWaktu)));



              _detailPokokPinjamanController.text = "RP " + (int.parse(_hargaRumahController.text) - int.parse(_uangMukaController.text)).toStringAsFixed(0);
              _detailAngsuranPerbulanController.text = "RP " + cicilan.round().toString();
              _detailUangMukaController.text = "RP " + _uangMukaController.text;
              _detailHargaRumahController.text = "RP " + _hargaRumahController.text;
              _detailTotalBungaController.text = "RP " + ((cicilan.round() * totalJangkaWaktu ) - pokokPinjaman).toStringAsFixed(0) ;
              _detailTotalPinjamanController.text = "RP " + (cicilan.round() * totalJangkaWaktu).toStringAsFixed(0) ;
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
              _formInput(),
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
                    child: TextFormField(
                      controller: _detailHargaRumahController,
                      enabled: false,
                      focusNode: FocusNode(),
                      enableInteractiveSelection: false,
                      style: text600Light,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                      ),
                    )
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
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: _detailAngsuranPerbulanController,
                        enabled: false,
                        focusNode: FocusNode(),
                        enableInteractiveSelection: false,
                        style: text600Light,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                        ),
                      )
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
                      child: TextFormField(
                        controller: _detailUangMukaController,
                        enabled: false,
                        focusNode: FocusNode(),
                        enableInteractiveSelection: false,
                        style: text600Light,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                        ),
                      )
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
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: _detailPokokPinjamanController,
                        enabled: false,
                        focusNode: FocusNode(),
                        enableInteractiveSelection: false,
                        style: text600Light,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                        ),
                      )
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
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: _detailTotalBungaController,
                        enabled: false,
                        focusNode: FocusNode(),
                        enableInteractiveSelection: false,
                        style: text600Light,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                        ),
                      )
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
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: _detailTotalPinjamanController,
                        enabled: false,
                        focusNode: FocusNode(),
                        enableInteractiveSelection: false,
                        style: text600Light,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
                        ),
                      )
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
