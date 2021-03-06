import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/users/register/register_success.dart';
import 'package:pakasep/utility/style.dart';

class CheckEmail extends StatefulWidget {
  final Map<String, dynamic> userData;
  const CheckEmail({Key key, this.userData}) : super(key: key);
  @override
  _CheckEmailState createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _registerAndSendEmail()async{
    await auth.createUserWithEmailAndPassword(email: widget.userData["Email"], password: widget.userData["Kata Sandi"]).then((value)async {
      await value.user.sendEmailVerification();
      String _userID = auth.currentUser.uid;
      DocumentReference docRefToNewUser = firestore.collection("Pengguna").doc(_userID);
      widget.userData.update("Kata Sandi", (value) {
        var bytes = utf8.encode(value);
        var digest = sha1.convert(bytes);
        return digest;
      });
      docRefToNewUser.set(widget.userData);
      print('User berhasil terdaftar pada Database');
    });
  }

  Future<void> _checkEmailVerified() async{
    await auth.currentUser.reload();
    if(auth.currentUser.emailVerified){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterSuccess()));
    }
  }

  @override
  void initState() {
    if(auth.currentUser != null){
      _registerAndSendEmail();
    }
    Timer.periodic(Duration(seconds: 5), (timer) {
      _checkEmailVerified();
    });
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: AutoSizeText(
                    'Cek E-mail Anda',
                    style: title900Dark,
                    textAlign: TextAlign.center,
                    presetFontSizes: [28, 25, 20],
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: AutoSizeText(
                    'Periksa E-mail anda untuk melakukan verifikasi data dari PAKASEP agar data anda terverifikasi.',
                    textAlign: TextAlign.center,
                    style: subtitle600Light2,
                    presetFontSizes: [16, 15, 10],
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
