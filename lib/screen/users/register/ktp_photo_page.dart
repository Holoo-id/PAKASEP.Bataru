import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/popup_with_button.dart';
import 'package:pakasep/screen/users/register/otp_phone.dart';

import '../../../utility/style.dart';
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
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
                  height: size.height - 115,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Foto KTP',
                        style: title900Dark,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        flex: 0,
                        child: _imageFile == null
                            ? Container(height: 0, width: 0)
                            : Image.file(
                                File(_imageFile.path),
                                fit: BoxFit.fitWidth,
                              ),
                      ),
                      AutoSizeText.rich(
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
                              text: 'untuk proses selanjutnya',
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        presetFontSizes: [16, 12, 8],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FlatButton(
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
                              FirebaseVisionImage.fromFile(
                                  File(_imageFile.path));
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
                              'KTP Gagal',
                              'Ambil gambar lagi untuk re-scan KTP',
                              MaterialPageRoute(
                                  builder: (context) =>
                                      KtpPhotoPage(userData: widget.userData)),
                            );
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpPhone(userData: widget.userData)));
                          }
                        },
                        height: 60,
                        minWidth: size.width,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'LANJUTKAN',
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
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return Platform.isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator();
  }

}
