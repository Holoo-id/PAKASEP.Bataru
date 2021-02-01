import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/register/register_success.dart';
import 'package:pakasep/utility/style.dart';

class ImageApproval extends StatefulWidget {
  @override
  _ImageApprovalState createState() => _ImageApprovalState();
}

class _ImageApprovalState extends State<ImageApproval> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackOnlyAppbar(
                child: null,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                height: size.height - 115,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Persetujuan',
                      style: title900Dark,
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                          'Foto Selfie & KTP Sesuai?',
                          textAlign: TextAlign.center,
                          style: title600Dark,
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          'Pastikan Foto Selfie dan KTP sudah jelas sebelum melanjutkan. Foto yang tidak jelas akan mempengaruhi proses pengajuan.',
                          textAlign: TextAlign.center,
                          style: subtitle600Light2,
                          maxLines: 3,
                        ),
                      ],
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterSuccess()),
                        );
                      },
                      height: 60,
                      minWidth: size.width,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'MENGERTI',
                        style: buttonTextLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
