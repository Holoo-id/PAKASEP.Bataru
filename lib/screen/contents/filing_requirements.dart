import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/typhography.dart';
import 'package:url_launcher/url_launcher.dart';

class FilingRequirements extends StatefulWidget {
  @override
  _FilingRequirementsState createState() => _FilingRequirementsState();
}

class _FilingRequirementsState extends State<FilingRequirements> {
  Widget _buildContructionAlert(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(
        vertical: (MediaQuery.of(context).size.height / 4) * 1.5,
        horizontal: 25,
      ),
      child: Center(
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
                presetFontSizes: [20, 15, 10, 5],
                style: text600Dark,
              ),
              AutoSizeText.rich(
                TextSpan(
                  style: text400Grey,
                  children: [
                    TextSpan(
                      text: 'Untuk informasi bisa di cek di Instagram',
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
                presetFontSizes: [16, 15, 10, 5],
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

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
                  : Container(height: 0, width: 0),
              flexibleSpace: Container(
                width: size.width,
                color: Colors.transparent,
                child: WaveBackground(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: 0.84,
                          child: AutoSizeText(
                            'Persyaratan Pengajuan',
                            textAlign: TextAlign.center,
                            style: title900Dark,
                            presetFontSizes: [28, 25, 20, 15, 10, 5],
                          ),
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
          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: AutoSizeText.rich(
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
              ),
              GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                primary: false,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: (183 / 56),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset(
                        'images/b1.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset(
                        'images/b2.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset(
                        'images/b3.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset(
                        'images/b4.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF2F3F7),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.asset(
                        'images/b5.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: AutoSizeText(
                  'Rumah yang Diajukan',
                  style: title600Dark,
                  textAlign: TextAlign.center,
                  presetFontSizes: [24, 20, 15, 10, 5],
                ),
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
                buttonMinWidth: size.width * 0.4,
                children: [
                  ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildContructionAlert(context);
                      },
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      primary: Colors.white,
                    ),
                    child: AutoSizeText(
                      'Pilih Rumah',
                      textAlign: TextAlign.center,
                      style: buttonTextDark,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildContructionAlert(context);
                      },
                    ),
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

  _buildUnitCard() {
    return Column(
      children: [
        Container(
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
            children: [
              AutoSizeText(
                'Perumahan Griya Caraka Indah',
                style: title600Dark,
                textAlign: TextAlign.center,
                presetFontSizes: [15, 10, 5],
              ),
              AutoSizeText(
                'Cimalaka, Kab. Sumedang Jawa Barat',
                style: text400Grey,
                textAlign: TextAlign.center,
                // maxLines: 2,
                presetFontSizes: [12, 10, 5],
              ),
              SizedBox(
                height: 5,
              ),
              AutoSizeText(
                'PT TRI KARYA LINGGA (ASPRUMNAS)',
                style: text400Grey,
                textAlign: TextAlign.center,
                presetFontSizes: [6, 5],
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
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.125),
          child: Divider(
            thickness: 0.75,
            height: 60,
          ),
        ),
      ],
    );
  }
}
