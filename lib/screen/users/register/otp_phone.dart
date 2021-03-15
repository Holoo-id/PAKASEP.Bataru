import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/home.dart';
import 'package:pakasep/screen/users/register/register_form.dart';
import 'package:pakasep/screen/users/register/register_success.dart';
import 'package:pakasep/utility/typhography.dart';

class OtpPhone extends StatefulWidget {
  final Map<String, dynamic> userData;
  const OtpPhone({Key key, this.userData}) : super(key: key);
  @override
  _OtpPhoneState createState() => _OtpPhoneState();
}

class _OtpPhoneState extends State<OtpPhone> {
  String _verificationCode;
  String _inVerificationCode;
  String _userID;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Widget _buildKodeVerifikasi() {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String value) {
        if (value.isEmpty) {
          return 'Kode Verifikasi tidak boleh kosong';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _inVerificationCode = value;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Kode Verifikasi',
        labelText: 'Kode Verifikasi',
        labelStyle: form400Light,
        filled: true,
        fillColor: Color(0xffF2F3F7),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Background(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: AutoSizeText(
                    'Cek Ponsel Anda!',
                    textAlign: TextAlign.center,
                    style: title900Dark,
                    presetFontSizes: [28, 25, 20, 15, 10, 5],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(
                        'Masukkan Kode Verifikasi',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        presetFontSizes: [23, 20, 15, 10, 5],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: AutoSizeText(
                          'Kode verifikasi dikirim via SMS digunakan untuk menkonfirmasi akun anda',
                          textAlign: TextAlign.center,
                          style: subtitle600Light2,
                          presetFontSizes: [16, 15, 10, 5],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: _buildKodeVerifikasi(),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          print(_inVerificationCode);
                          print("Trying to compare verification ID");
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                                    PhoneAuthProvider.credential(
                                        verificationId: _verificationCode,
                                        smsCode: _inVerificationCode))
                                .then((value) async {
                              if (value.user != null) {
                                print('user berhasil terdaftar pada Auth');
                                _userID = FirebaseAuth.instance.currentUser.uid;
                                DocumentReference docRefToNewUser = _firestore
                                    .collection("Pengguna")
                                    .doc(_userID);
                                docRefToNewUser.set(widget.userData);
                                print('user berhasil terdaftar pada Database');
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterSuccess()),
                                );
                              }
                            });
                          } catch (e) {
                            FocusScope.of(context).unfocus();
                            print(e);
                            _showMyDialog();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(size.width, 60),
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'KIRIM',
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

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+62${widget.userData['Telepon']}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              print('user terdaftar di Auth secara otomatis');
              _userID = FirebaseAuth.instance.currentUser.uid;
              DocumentReference docRefToNewUser =
                  _firestore.collection("Pengguna").doc(_userID);
              docRefToNewUser.set(widget.userData);
              print('user berhasil terdaftar pada Database');
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print("user gagal terdaftar di Auth");
          print(e.message);
        },
        codeSent: (String verificationID, int resendToken) {
          print("Mencoba secara manual");
          setState(() {
            _verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          print("Proses otomatis telah timeout");
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 5));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Data Pengguna Tidak Dapat Dimasukkan'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('Would you like to approve of this message?'),
                Text('Kembali ke Formulir Pendafataran'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Oke'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterForm()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
