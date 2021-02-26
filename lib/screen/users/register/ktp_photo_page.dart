import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/users/register/image_approval.dart';

import '../../../utility/style.dart';
import '../../components/background.dart';
import 'register_success.dart';

class KtpPhotoPage extends StatefulWidget {
  @override
  _KtpPhotoPageState createState() => _KtpPhotoPageState();
}

class _KtpPhotoPageState extends State<KtpPhotoPage> {
  File imageFile;
  var isLoading = false;
  var result = 'Result In Here';

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
                        child: imageFile == null
                            ? Container(height: 0, width: 0)
                            : Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Expanded(
                        child: Center(
                          // child: Text(result),
                          child:
                              isLoading ? _buildWidgetLoading() : Text(result),
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
                              text:
                                  'untuk proses selanjutnya atau kembali untuk foto ulang',
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
                          var pickedFile = await ImagePicker()
                              .getImage(source: ImageSource.camera);
                          if (pickedFile == null) {
                          } else {
                            setState(
                              () {
                                isLoading = true;
                              },
                            );
                            imageFile = File(pickedFile.path);
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageApproval(),
                                  ),
                                );
                              },
                            );
                            var firebaseVisionImage =
                                FirebaseVisionImage.fromFile(imageFile);
                            var textRecognizer =
                                FirebaseVision.instance.textRecognizer();
                            var visionText = await textRecognizer
                                .processImage(firebaseVisionImage);
                            result = 'Result: ${visionText.text}';
                            debugPrint('result: $result');
                            textRecognizer.close();
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
