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
      print(widget.userData["Kata Sandi"]);
      print("mencoba mengirim email verifikasi");
      String _userID = auth.currentUser.uid;
      DocumentReference docRefToNewUser = firestore.collection("Pengguna").doc(_userID);
      widget.userData.update("Kata Sandi", (value) {
        var bytes = utf8.encode(value);
        var digest = sha1.convert(bytes);
        return digest;
      });
      await docRefToNewUser.set(widget.userData);
      print('user berhasil terdaftar pada Database');
    });
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterSuccess()));
  }


  @override
  void initState() {
    if(auth.currentUser == null){
      print("belum ada user yang login");
      _registerAndSendEmail();
    }
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WaveBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackOnlyAppbar(child: null),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        'Cek E-mail Anda',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        // phase1
                        'Cek e-mail untuk memverifikasi akun e-mail Anda di Pakasep',
                        // default
                        // 'Klik tombol dibawah ini untuk masuk ke aplikasi',
                        textAlign: TextAlign.center,
                        style: subtitle600Light2,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
