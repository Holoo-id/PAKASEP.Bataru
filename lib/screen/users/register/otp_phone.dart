import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/password/new_password_form.dart';
import 'package:pakasep/utility/style.dart';

class OtpPhone extends StatefulWidget {
  final Map userData;
  const OtpPhone({Key key, this.userData}) : super(key: key);
  @override
  _OtpPhoneState createState() => _OtpPhoneState();
}

class _OtpPhoneState extends State<OtpPhone> {
  String _kodeVerifikasi;
  String _kodeAslinya;
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
        }
      },
      onSaved: (String value) {
        _kodeVerifikasi = value;
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackOnlyAppbar(child: null),
              Container(
                height: size.height - 115,
                padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AutoSizeText(
                        'Cek Ponsel Anda!',
                        textAlign: TextAlign.center,
                        style: title900Dark,
                        maxLines: 1,
                      ),
                      Column(
                        children: <Widget>[
                          AutoSizeText(
                            'Masukkan Kode Verifikasi',
                            textAlign: TextAlign.center,
                            style: title600Dark,
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            'Kode verifikasi dikirim via SMS digunakan untuk menkonfirmasi akun anda',
                            textAlign: TextAlign.center,
                            style: subtitle600Light2,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          _buildKodeVerifikasi(),
                          SizedBox(
                            height: 25.0,
                          ),
                          FlatButton(
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print(_kodeVerifikasi);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewPasswordForm()),
                              );
                            },
                            height: 60,
                            minWidth: size.width,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'KIRIM',
                              style: buttonTextLight,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1,
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