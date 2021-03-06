import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/utility/style.dart';

import '../login/login_form.dart';

class CheckEmail extends StatefulWidget {
  final Map<String, dynamic> userData;
  const CheckEmail({Key key, this.userData}) : super(key: key);
  @override
  _CheckEmailState createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _registerAndSendEmail() async {
    await auth
        .createUserWithEmailAndPassword(
            email: widget.userData["Email"],
            password: widget.userData["Kata Sandi"])
        .then((value) async {
      print(widget.userData["Kata Sandi"]);
      print("mencoba mengirim email verifikasi");
      String _userID = auth.currentUser.uid;
      DocumentReference docRefToNewUser =
          firestore.collection("Pengguna").doc(_userID);
      var bytes = utf8.encode(widget.userData["Kata Sandi"]);
      var digest = sha1.convert(bytes);
      widget.userData["Kata Sandi"] = digest.toString().trim();
      await docRefToNewUser.set(widget.userData);
      print('user berhasil terdaftar pada Database');
    });
  }

  @override
  void initState() {
    if (auth.currentUser == null) {
      print("belum ada user yang login");
      _registerAndSendEmail();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 65),
        child: BackOnlyAppbar(
          child: null,
        ),
      ),
      body: WaveBackground(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.075, horizontal: size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: AutoSizeText(
                    // 'Cek E-mail Anda',
                    'Pendaftaran Selesai',
                    style: title900Dark,
                    textAlign: TextAlign.center,
                    presetFontSizes: [28, 25, 20],
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: AutoSizeText(
                    'Harap menunggu konfirmasi dari Admin PAKASEP setelah tahap pra-registrasi selesai. Data Anda sudah kami terima dan terdaftar di database kami.',
                    // 'Periksa E-mail anda untuk melakukan verifikasi data dari PAKASEP agar data anda terverifikasi.',
                    textAlign: TextAlign.center,
                    style: subtitle600Light2,
                    presetFontSizes: [16, 15, 10],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginForm()),
                      );
                    },
                    height: 60,
                    minWidth: size.width,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'SELESAI',
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
