import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/home.dart';
import 'package:pakasep/screen/users/password/phone_form.dart';
import 'package:pakasep/screen/users/register/register_form.dart';
import 'package:pakasep/utility/style.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _ktp = "1234567890123456";
  String _kataSandi = "qwertyuiop";

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
        if (value != _kataSandi) {
          return 'Kata sandi salah atau tidak sesuai';
        }
      },
      onSaved: (String value) {
        _kataSandi = value;
      },
      style: form200Light,
      decoration: InputDecoration(
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
        if (value != _ktp) {
          return 'Akun tidak ditemukan atau belum terdaftar';
        }
      },
      onSaved: (String value) {
        _ktp = value;
      },
      style: form200Light,
      decoration: InputDecoration(
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
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                  height: size.height - 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print(_kataSandi);
                              print(_ktp);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
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
