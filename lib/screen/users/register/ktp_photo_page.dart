import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/popup_with_button.dart';
import 'package:pakasep/screen/users/register/check_email.dart';

import '../../../utility/typhography.dart';
import '../../components/background.dart';

class KtpPhotoPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  @override
  KtpPhotoPage({Key key, this.userData}) : super(key: key);
  _KtpPhotoPageState createState() => _KtpPhotoPageState();
}

class _KtpPhotoPageState extends State<KtpPhotoPage> {
  PickedFile _imageFile;
  var isLoading = false;
  String result = 'Result In Here\n';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 65),
        child: BackOnlyAppbar(
          child: null,
        ),
      ),
      body: Background(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisSize:,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Verifikasi Foto KTP',
                    style: title900Dark,
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: _imageFile == null
                      ? Container(height: 0, width: 0)
                      : FractionallySizedBox(
                          widthFactor: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.file(
                              File(_imageFile.path),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: AutoSizeText.rich(
                    TextSpan(
                      style: text500Grey,
                      children: [
                        TextSpan(
                          text: 'Klik ',
                        ),
                        TextSpan(
                          text: 'LANJUTKAN ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: 'untuk pengambilan foto KTP.',
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    presetFontSizes: [16, 12, 8],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () async {
                      final pickedFile = await ImagePicker()
                          .getImage(source: ImageSource.camera);
                      setState(() {
                        if (pickedFile != null) {
                          _imageFile = pickedFile;
                        } else {
                          print("no image");
                        }
                      });
                      final FirebaseVisionImage visionImage =
                          FirebaseVisionImage.fromFile(File(_imageFile.path));
                      final TextRecognizer textRecognizer =
                          FirebaseVision.instance.textRecognizer();
                      final VisionText visionText =
                          await textRecognizer.processImage(visionImage);
                      bool isKtpNotValid = true;
                      for (TextBlock block in visionText.blocks) {
                        for (TextLine line in block.lines) {
                          result += line.text + '\n';
                          if (line.text == widget.userData["KTP"] ||
                              line.text == ":${widget.userData['KTP']}" ||
                              line.text == ": ${widget.userData['KTP']}") {
                            print("KTP valid");
                            isKtpNotValid = false;
                          }
                        }
                      }
                      print(result);
                      if (isKtpNotValid) {
                        print("ktp gagal : ");
                        print(isKtpNotValid);
                        popupWithButton(
                          context,
                          'Verifikasi KTP Gagal'.toUpperCase(),
                          'Mohon ulangi kembali. Pastikan KTP terlihat jelas dan pencahayaan yang cukup.',
                          MaterialPageRoute(
                              builder: (context) =>
                                  KtpPhotoPage(userData: widget.userData)),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CheckEmail(userData: widget.userData)),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      minimumSize: Size(size.width, 60),
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'LANJUTKAN',
                      style: buttonTextLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
