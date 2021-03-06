import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/password/new_password_complete.dart';
import 'package:pakasep/utility/style.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({Key key}) : super(key: key);
  @override
  _NewPasswordFormState createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  String _kataSandi;
  Icon passIcon = new Icon(null);
  Icon passwordIcon = new Icon(null);

  Widget _buildKataSandi() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (String kata_sandi) {
        if (kata_sandi.isEmpty) {
          return 'Kata sandi harus diisi';
        }
        if (kata_sandi.length < 5) {
          return 'Kata sandi terlalu pendek';
        }
        // if (!RegExp(r"^(?=.*?[0-9])$").hasMatch(value)) {
        //   return 'Setidaknya terdapat 1 digit angka';
        // }
      },
      onChanged: (kata_sandi) {
        if (kata_sandi.length > 5) {
          setState(() {
            passIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        } else {
          setState(() {
            passIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        }
        _kataSandi = kata_sandi;
      },
      style: form200Light,
      decoration: InputDecoration(
          hintText: 'Kata Sandi',
          labelText: 'Kata Sandi',
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          suffixIcon: passIcon,
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

  Widget _buildKonfirmasiKataSandi() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: (password) {
        if (password == _kataSandi) {
          setState(() {
            passwordIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        } else {
          setState(() {
            passwordIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        }
      },
      validator: (String password) {
        if (password.isEmpty) {
          return 'Konfirmasi kata sandi harus diisi';
        }
        if (password != _kataSandi) {
          return 'Konfirmasi kata sandi tidak sama';
        }
      },
      onSaved: (String password) {
        _kataSandi = password;
      },
      style: form200Light,
      decoration: InputDecoration(
          hintText: 'Kata Sandi',
          labelText: 'Konfirmasi Kata Sandi',
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          suffixIcon: passwordIcon,
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BackOnlyAppbar(child: null),
              Form(
                key: _formKey,
                child: Container(
                  height: size.height,
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AutoSizeText(
                        'Lupa Kata Sandi?',
                        textAlign: TextAlign.center,
                        style: title900Dark,
                        maxLines: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            'Masukkan Kata Sandi',
                            textAlign: TextAlign.center,
                            style: title600Dark,
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            'Kata sandi pengganti harus mengandung huruf dan angka',
                            textAlign: TextAlign.center,
                            style: subtitle600Light2,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          _buildKataSandi(),
                          SizedBox(
                            height: 10,
                          ),
                          _buildKonfirmasiKataSandi(),
                          SizedBox(
                            height: 25.0,
                          ),
                          FlatButton(
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print(_kataSandi);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NewPasswordComplete()),
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
