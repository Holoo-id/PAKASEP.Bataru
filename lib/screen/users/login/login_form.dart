import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/login/login_otp.dart';
import 'package:pakasep/screen/users/password/phone_form.dart';
import 'package:pakasep/screen/users/register/register_form.dart';
import 'package:pakasep/utility/style.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _ktp;
  String _kataSandi;
  String _nomorTelepon;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createAlertDialog(BuildContext context){
    TextEditingController TEVerifikasiKode = TextEditingController();
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Masukkan kode verifikasi yang telah dikirim ke nomor anda:"),
        content: TextField(
          controller: TEVerifikasiKode,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('Submit'),
            onPressed: () {
                Navigator.of(context).pop(TEVerifikasiKode.text.toString());
            },
          )
        ],
      );
    });
  }

  Widget _buildKataSandi() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Kata sandi harus diisi';
        }
        if (value.length < 5) {
          return 'Kata sandi terlalu pendek';
        }
      },
      onSaved: (String value) {
        _kataSandi = value;
      },
      style: form200Light,
      decoration: InputDecoration(
          counterText: '',
          hintText: 'Kata Sandi',
          labelText: 'Kata Sandi',
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
          )),
    );
  }

  Widget _buildKtp() {
    return TextFormField(
      keyboardType: TextInputType.number,
      maxLength: 16,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nomor KTP harus diisi';
        }
        if (value.length < 16) {
          return 'Harus diisi 16 digit Nomor KTP';
        }
      },
      onSaved: (String value) {
        _ktp = value;
      },
      style: form200Light,
      decoration: InputDecoration(
        counterText: '',
        hintText: 'Nomor KTP (16 Digit)',
        labelText: 'Nomor KTP',
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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 65),
        child: BackOnlyAppbar(
          child: null,
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                  height: size.height,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Masuk Akun',
                        textAlign: TextAlign.center,
                        style: title900Dark,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildKtp(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildKataSandi(),
                          SizedBox(
                            height: 55.0,
                          ),
                          FlatButton(
                            onPressed: () async {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print(_kataSandi);
                              print(_ktp);
                              CollectionReference _searchUser = _firestore.collection("Pengguna");
                              await _searchUser.where("KTP", isEqualTo: _ktp).where("Kata Sandi", isEqualTo: _kataSandi).get().then((QuerySnapshot _snapshot){
                                if(_snapshot.docs.length > 0){
                                  _snapshot.docs.forEach((element) {
                                    print(element.data()["Telepon"]);
                                    _nomorTelepon = element.data()["Telepon"];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LoginOtp(noTelepon: _nomorTelepon,)),
                                    );
                                  });
                                }
                                else{
                                  print("empty query");
                                  _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Password atau No KTP mu salah!")));
                                }
                              });
                            },
                            height: 60,
                            minWidth: size.width,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'MASUK',
                              style: buttonTextLight,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneForm()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Lupa Password?',
                                style: linkTextLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterForm()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: AutoSizeText(
                            'BELUM PUNYA AKUN? DAFTAR DISINI',
                            style: linkTextLight,
                            maxLines: 1,
                            presetFontSizes: [14, 10.5, 7],
                          ),
                        ),
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
