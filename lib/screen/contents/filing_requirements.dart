import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/contents/all_available_units.dart';
import 'package:pakasep/screen/contents/filing_status.dart';
import 'package:pakasep/utility/style.dart';

class FilingRequirements extends StatefulWidget {
  @override
  _FilingRequirementsState createState() => _FilingRequirementsState();
}

class _FilingRequirementsState extends State<FilingRequirements> {
  bool filHouse = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              // toolbarHeight: size.height * 0.125,
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
                          'Persyaratan Pengajuan',
                          textAlign: TextAlign.center,
                          style: title900Dark,
                          maxLines: 1,
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Pusat Pengelolaan Dana Pembiayaan Perumahan (PPDPP) bekerjasama dengan bank pelaksana memberikan Fasilitas Likuiditas Pembiayaan Perumahan (FLPP) untuk perumahan subsidi.\n',
                    ),
                    TextSpan(
                      text: '\nSyaratnya sendiri terdiri dari:\n',
                    ),
                    TextSpan(
                      text:
                          '- Penerima adalah Warga Negara Indonesia (WNI) dan berdomisili di Indonesia;\n- Penerima telah berusia 21 tahun atau telah menikah;\n- Penerima maupun pasangan (suami/istri) belum memiliki rumah dan belum pernah menerima subsidi pemerintah untuk pemilikan rumah;\n- Penghasilan maksimum 8 juta untuk rumah tapak dan susun;\n- Memiliki masa kerja atau usaha minimal 1 tahun;\n- Memilki Nomor Pokok Wajib Pajak (NPWP) atau Surat Pemberitahuan (SPT) Tahunan Pajak Penghasilan (PPh) orang pribadi sesuai perundang-undangan yang berlaku.\n',
                    ),
                    TextSpan(
                      text:
                          '\nAnda dapat memilih rumah dan mengajukan KPR ke bank yang terdaftar dibawah ini:',
                    ),
                  ],
                ),
              ),
              GridView.count(
                primary: false,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: (183 / 56),
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Image.asset('images/b1.png'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Image.asset('images/b2.png'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Image.asset('images/b3.png'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Image.asset('images/b4.png'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: Image.asset('images/b5.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              AutoSizeText(
                'Rumah yang Diajukan',
                style: title600Dark,
                maxLines: 1,
                presetFontSizes: [24, 18, 12],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 35,
                ),
                child: filHouse == true ? _buildUnitCard() : _buildEmptyText(),
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
                          builder: (context) => AllAvailableUnits(),
                        ),
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
                      'Pilih Rumah',
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
                          builder: (context) => FilingStatus(),
                        ),
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
    );
  }

  _buildUnitCard() {
    return Column(
      children: [
        Container(
          // height: size.width / 2,
          height: 240,
          width: 185,
          decoration: BoxDecoration(
            color: Color(0xffc4c4c4),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage('images/r2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AutoSizeText(
                'Perumahan Griya Caraka Indah',
                style: title600Dark,
                textAlign: TextAlign.center,
                maxLines: 2,
                presetFontSizes: [15, 10.75, 7.5],
              ),
              AutoSizeText(
                'Cimalaka, Kab. Sumedang Jawa Barat',
                style: text400Grey,
                textAlign: TextAlign.center,
                maxLines: 2,
                presetFontSizes: [12, 9, 6],
              ),
              SizedBox(
                height: 5,
              ),
              AutoSizeText(
                'PT TRI KARYA LINGGA (ASPRUMNAS)',
                style: text400Grey,
                textAlign: TextAlign.center,
                maxLines: 1,
                presetFontSizes: [6, 4.5, 3],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildEmptyText() {
    return Column(
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
          'Silahkan memilih rumah terlebih dahulu sebelum melanjutkan ke proses pilih bank',
          style: text500Grey,
          maxLines: 2,
          presetFontSizes: [16, 12, 8],
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Divider(
            thickness: 0.75,
            height: 60,
          ),
        ),
      ],
    );
  }
}
